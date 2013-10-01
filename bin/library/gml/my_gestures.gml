<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage xmlns:gml="http://gestureworks.com/gml/version/1.0">
		
	<Gesture_set gesture_set_name="artAlbum-gestures">
						
			<Gesture id="n-tap" type="tap">
				<match>
					<action>
						<initial>
							<point event_duration_max="200" translation_max="10"/>
							<cluster point_number="0"/>
							<event touch_event="touchEnd"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="temporalmetric" type="discrete">
						<library module="tap"/>
						<returns>
							<property id="tap_x" result="x"/>
							<property id="tap_y" result="y"/>
							<property id="tap_n" result="n"/>
						</returns>
					</algorithm>
				</analysis>	
				<mapping>
					<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
						<gesture_event  type="tap">
							<property ref="tap_x"/>
							<property ref="tap_y"/>
							<property ref="tap_n"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>
				
			<Gesture id="n-manipulate-inertia-boundary" type="manipulate">
				<match>
					<action>
						<initial>
							<cluster point_number="0" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="kinemetric" type="continuous">
						<library module="manipulate"/>
						<returns>
							<property id="dx" result="dx"/>
							<property id="dy" result="dy"/>
							<property id="dsx" result="ds"/>
							<property id="dsy" result="ds"/>
							<property id="dtheta" result="dtheta"/>
						</returns>
					</algorithm>
				</analysis>	
				<processing>
					<inertial_filter>
						<property ref="dx" active="true" friction="0.9"/>
						<property ref="dy" active="true" friction="0.9"/>
						<property ref="dsx" active="true" friction="0.9"/>
						<property ref="dsy" active="true" friction="0.9"/>
						<property ref="dtheta" active="true" friction="0.9"/>
					</inertial_filter>
					<delta_filter>
						<property ref="dx" active="true" delta_min="0.0" delta_max="100"/>
						<property ref="dy" active="true" delta_min="0.0" delta_max="100"/>
						<property ref="dsx" active="true" delta_min="0.0" delta_max="0.2"/>
						<property ref="dsy" active="true" delta_min="0.0" delta_max="0.2"/>
						<property ref="dtheta" active="false"/>
					</delta_filter>
					<boundary_filter>
						<property ref="dx" active="true" boundary_min="200" boundary_max="1720"/>
						<property ref="dy" active="true" boundary_min="200" boundary_max="880"/>
						<property ref="dsx" active="true" boundary_min="0.8" boundary_max="1.5"/>
						<property ref="dsy" active="true" boundary_min="0.8" boundary_max="1.5"/>
						<property ref="dtheta" active="false"/>
					</boundary_filter>
				</processing>
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event  type="manipulate">
							<property ref="dx" target="x"/>
							<property ref="dy" target="y"/>
							<property ref="dsx" target="scaleX"/>
							<property ref="dsy" target="scaleY"/>
							<property ref="dtheta" target="rotation"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>
			
			<Gesture id="album-drag" type="drag">
				<comment>The 'n-drag' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object the position
				of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
				<match>
					<action>
						<initial>
							<cluster point_number="0" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="kinemetric" type="continuous">
						<library module="drag"/>
						<returns>
							<property id="drag_dx" result="dx"/>
							<property id="drag_dy" result="dy"/>
						</returns>
					</algorithm>
				</analysis>	
				<processing>
					<inertial_filter>
						<property ref="drag_dx" active="true" friction="0.3"/>
						<property ref="drag_dy" active="true" friction="0.3"/>
					</inertial_filter>
					<delta_filter>
						<property ref="drag_dx" active="true" delta_min="0.05" delta_max="500"/>
						<property ref="drag_dy" active="true" delta_min="0.05" delta_max="500"/>
					</delta_filter>
				</processing>
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event type="drag">
							<property ref="drag_dx" target="x"/>
							<property ref="drag_dy" target="y"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>	
				
			<Gesture id="n-drag-inertia" type="drag">
				<comment>The 'n-drag' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object the position
				of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
				<match>
					<action>
						<initial>
							<cluster point_number="0" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="kinemetric" type="continuous">
						<library module="drag"/>
						<returns>
							<property id="drag_dx" result="dx"/>
							<property id="drag_dy" result="dy"/>
						</returns>
					</algorithm>
				</analysis>	
				<processing>
					<inertial_filter>
						<property ref="drag_dx" active="true" friction="0.9"/>
						<property ref="drag_dy" active="true" friction="0.9"/>
					</inertial_filter>
					<delta_filter>
						<property ref="drag_dx" active="true" delta_min="0.05" delta_max="500"/>
						<property ref="drag_dy" active="true" delta_min="0.05" delta_max="500"/>
					</delta_filter>
				</processing>
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event type="drag">
							<property ref="drag_dx" target="x"/>
							<property ref="drag_dy" target="y"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>		
			
			<Gesture id="n-drag" type="drag">
				<comment>The 'n-drag' gesture can be activated by any number of touch points between 1 and 10. When a touch down is recognized on a touch object the position
				of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
				<match>
					<action>
						<initial>
							<cluster point_number="0" point_number_min="1" point_number_max="10"/>
						</initial>
					</action>
				</match>	
				<analysis>
					<algorithm class="kinemetric" type="continuous">
						<library module="drag"/>
						<returns>
							<property id="drag_dx" result="dx"/>
							<property id="drag_dy" result="dy"/>
						</returns>
					</algorithm>
				</analysis>	
				<mapping>
					<update dispatch_type="continuous">
						<gesture_event type="drag">
							<property ref="drag_dx" target="x"/>
							<property ref="drag_dy" target="y"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>
			
		</Gesture_set>	
	
</GestureMarkupLanguage>