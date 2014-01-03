package 
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import com.gestureworks.cml.core.*;
	import com.gestureworks.cml.elements.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.cml.managers.*;
	import com.gestureworks.cml.utils.*;
	import com.gestureworks.core.*;
	import com.gestureworks.events.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.elements.Accordion;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.greensock.*;


	[SWF(width = "1920", height = "1080", backgroundColor = "0x000000", frameRate = "60")]

	public class Main extends GestureWorks
	{
		public function Main():void 
		{
			super();
			cml = "Timeline.cml";
			gml = "library/gml/my_gestures.gml";
			
			// add this event listener so we know when the CML parsing is complete
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");			
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			addEventListener(StateEvent.CHANGE, onStateEvent);
		}
		
		private function onStateEvent(e:StateEvent):void {
			trace(e.target, e.currentTarget, e.id, e.property, e.value);
			if (CMLObjectList.instance.getId(e.value)) {
				CMLObjectList.instance.getId(e.value).visible = !(CMLObjectList.instance.getId(e.value).visible);
			}
			
			
		}
	}
}