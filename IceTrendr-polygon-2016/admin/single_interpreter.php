<?PHP

$mysqli = new mysqli('localhost', 'LTRobot', 'JuvzF6jzQl', 'landtrendr2');


$rs = $mysqli->query("  SELECT p.*, i.user_name, A.tsa, A.interpreter, count(*) as cnt, total
                        FROM
                           (SELECT DISTINCT project_id, tsa, plotid, interpreter
                            FROM change_process
                            GROUP BY project_id, tsa, plotid
                            HAVING count(*)=1)
                            as A 
                        LEFT JOIN
                           (SELECT project_id, tsa, count(*) as total
                            FROM change_process
                            GROUP BY Project_id, tsa)
                            as B
                        ON A.project_id = B.project_id AND A.tsa = B.tsa,
                        projects as p, interpreter as i
                        WHERE p.project_id = A.project_id AND i.user_id = A.interpreter
                        GROUP BY A.project_id, A.tsa
                        ")
                    or die($mysqli->error);

$pid = -1;
$out = '';
$projout = '';
while($r = $rs->fetch_assoc()) {
    
    $r['tsa'] = substr($r['tsa'], 0,2) . '/' . substr($r['tsa'], -2);
    
    if($r['project_id'] != $pid) {
        $pid = $r['project_id'];
        if ($projout) {
            $rate = round(100*$total_sing/ $total_plots);
            $projout = str_replace(array('{rate}', '{total_singletons}', '{total_plots}', '{tsa_cnt}'),
                                   array($rate, $total_sing, $total_plots,$tsa_cnt),
                                   $projout);
            $projout .= "<tr class=\"spacer\"><td colspan=6></td></tr>\n\n";
        }
        $out .= $projout;
        $total_sing = 0;
        $total_plots = 0;
        $tsa_cnt = 0;
        $projout = "<tr class=\"new_proj\"><td class=\"project\">$r[project_id]: ($r[project_code])</td><td></td><td></td><td>{total_singletons}</td><td>{total_plots}</td><td>{rate}%</td></tr>\n";
    }
    $tsa_cnt++;
    $rate = round(100*$r['cnt']/$r['total']);
    if($tsa_cnt == 1){
        $projout .= "<tr><td class=\"project\" rowspan=\"{tsa_cnt}\">$r[project_name]</td>
                         <td>$r[user_name]</td><td>$r[tsa]</td><td>$r[cnt]</td><td>$r[total]</td><td>$rate%</td></tr>\n";
    }else {
        $projout .= "<tr><td>$r[user_name]</td><td>$r[tsa]</td><td>$r[cnt]</td><td>$r[total]</td><td>$rate%</td></tr>\n";
    }
    $total_sing += $r['cnt'];
    $total_plots += $r['total'];

    
}

?>

<style>
body {font:normal 10pt Arial}
#frame {width:500px; margin:auto;}
table {border-collapse:collapse;
     empty-cells:show}

tr.spacer td {padding:10px;}
     
tr.new_proj td {
    border-top:1px solid #999;
    font-weight:bold;
    background-color:#ffc;
    }

tr.new_proj td {padding-top:3px;}
    
td.project{text-align:left}
td{ padding:2px 5px;
    text-align:center;
    vertical-align:top}

    
</style>


<div id="frame">

<h3>Number of Patches with 1 Interpretation by Project & TSA</h3>
<table>
<tr><th>Project</th><th>User</th><th>TSA</th><th>#</th><th>Total</th></tr>
<?=$out?></table>
</div>

