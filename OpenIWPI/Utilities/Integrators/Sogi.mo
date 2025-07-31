within OpenIWPI.Utilities.Integrators;
model Sogi "SOGI - Second Order Generalized Integrator model"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Real FilterGain = 1.41 "Filter gain";
  parameter Real FrequencyHz = 60 "System nominal frequency";
  Modelica.Blocks.Math.Feedback feedback annotation(Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = FilterGain) annotation(Placement(visible = true, transformation(origin = {-34.893, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(Placement(visible = true, transformation(origin = {-4.607, -0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain2(k = 2 * C.pi * FrequencyHz) annotation(Placement(visible = true, transformation(origin = {24.02, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator1(initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {56.598, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator integrator2(initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(Placement(visible = true, transformation(origin = {56.153, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain3(k = 2 * C.pi * FrequencyHz) annotation(Placement(visible = true, transformation(origin = {20, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput v_in annotation(Placement(visible = true, transformation(origin={-120,0},     extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin={-120,0},extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput v annotation(Placement(visible = true, transformation(origin={110,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput qv annotation(Placement(visible = true, transformation(origin={110,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={110,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(feedback.y, gain1.u) annotation(Line(visible = true, origin = {-53.947, -0}, points={{-7.053,
          0},{7.054,0}},                                                                                                    color = {1, 37, 163}));
  connect(gain1.y, feedback2.u1) annotation(Line(visible = true, origin = {-18.25, -0}, points = {{-5.643, -0}, {5.643, 0}}, color = {1, 37, 163}));
  connect(feedback2.y, gain2.u) annotation(Line(visible = true, origin = {8.206, -0}, points={{-3.813,
          0},{3.814,0}},                                                                                                   color = {1, 37, 163}));
  connect(gain3.u, integrator2.y) annotation(Line(visible = true, origin = {38.577, -40}, points={{-6.577,
          0},{6.576,0}},                                                                                                      color = {1, 37, 163}));
  connect(gain3.y, feedback2.u2) annotation(Line(visible = true, origin = {-0.072, -29.333}, points={{9.072,
          -10.667},{-4.535,-10.667},{-4.535,21.333}},                                                                                                          color = {1, 37, 163}));
  connect(integrator1.y, integrator2.u) annotation(Line(visible = true, origin = {73.938, -20}, points={{-6.34,
          20},{6.062,20},{6.062,-20},{-5.785,-20}},                                                                                                               color = {1, 37, 163}));
  connect(v_in, feedback.u1) annotation(Line(visible = true,                     points={{-120,0},
          {-78,0}},                                                                                             color = {1, 37, 163}));
  connect(gain3.y, qv) annotation(Line(visible = true,                             points={{9,-40},
          {6,-40},{6,-54},{94,-54},{94,-40},{110,-40}},                                                                                                                                                    color = {1, 37, 163}));
  connect(integrator1.y, feedback.u2) annotation(Line(visible = true, origin = {17.52, 13.6}, points = {{50.078, -13.6}, {62.48, -13.6}, {62.48, 16.4}, {-87.52, 16.4}, {-87.52, -5.6}}, color = {1, 37, 163}));
  connect(gain2.y, integrator1.u) annotation(Line(visible = true, origin = {39.809, 0}, points = {{-4.789, 0}, {4.789, 0}}, color = {1, 37, 163}));
  connect(integrator1.y, v) annotation (Line(points={{67.598,0},{90,0},{90,40},
          {110,40}},color={0,0,127}));
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false, initialScale = 1, grid = {10, 10}), graphics={  Text(visible = true, origin = {-4.527, -0}, extent = {{-55.473, -34.767}, {55.473, 34.767}},
          textString="SOGI",
          textColor={0,0,0})}));
end Sogi;
