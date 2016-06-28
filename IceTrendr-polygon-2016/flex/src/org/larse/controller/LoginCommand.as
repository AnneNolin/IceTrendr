package org.larse.controller
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;

	import org.larse.events.UserEvent;
	import org.larse.model.GlobalModel;
	import org.larse.services.LandtrendrService;
	import org.larse.vos.Interpreter;
	import org.larse.vos.Plot;

	public class LoginCommand
	{
		[Inject] public var service:LandtrendrService;
		[Inject] public var global:GlobalModel;

		public function LoginCommand() {}

		public function execute(event:UserEvent):AsyncToken
		{
			return service.login(event.usr.user_name, event.usr.pass);
		}

		public function result(list:Interpreter):void
		{
			global.interpreter = list as Interpreter;
		}

		public function error(fault:FaultEvent):void
		{
			Alert.show("Database had an error", "Login Error");
		}
	}
}