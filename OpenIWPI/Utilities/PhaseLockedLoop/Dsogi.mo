within OpenIWPI.Utilities.PhaseLockedLoop;
model Dsogi "Synchronous reference frame PLL with double SOGI filters: in alfa and beta axes"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Types.Frequency SysFreq = 60 "System nominal frequency";
  parameter Types.Voltage VLine = 230e3 "System nominal RMS line voltage";
  parameter Real Gain = 1.41 "SOGI pass band filter gain";
  parameter Types.Frequency Freq = 100 "Cut-off frequency for CL synchronous reference frame PI block";
  parameter Real Xi = 0.707 "Desired damping coefficient for CL synchronous reference frame";
  Modelica.Blocks.Interfaces.RealInput vA annotation(Placement(visible = true, transformation(origin={-120,70},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vB annotation(Placement(visible = true, transformation(origin={-120,0},   extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vC annotation(Placement(visible = true, transformation(origin={-120,-70},    extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  OpenIWPI.Utilities.Transformations.Clarke clarke_xform annotation(Placement(visible = true, transformation(origin={-76,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 0.5) annotation(Placement(visible = true, transformation(origin={-50,
            30},                                                                                                   extent = {{-10, -10}, {10, 10}}, rotation=0)));
  Modelica.Blocks.Math.Gain gain2(k = 0.5) annotation(Placement(visible = true, transformation(origin={-50,
            -30.02},                                                                                                   extent = {{-10, -10}, {10, 10}}, rotation=0)));
  OpenIWPI.Utilities.Integrators.Sogi sogi_2(FilterGain = Gain, FrequencyHz = SysFreq) annotation(Placement(visible = true, transformation(origin={-20,
            -30.107},                                                                                                                                             extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIWPI.Utilities.Integrators.Sogi sogi_1(FilterGain = Gain, FrequencyHz = SysFreq) annotation(Placement(visible = true, transformation(origin={-20,30},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1(k2 = -1) annotation(Placement(visible = true, transformation(origin={20,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add2 annotation(Placement(visible = true, transformation(origin={20,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIWPI.Utilities.Transformations.Park park_xform annotation(Placement(visible = true, transformation(origin={54,0},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI pi(k = 4 * C.pi * Freq * Xi * sqrt(3) / (VLine * sqrt(2)), T = 2 * Xi / (2 * C.pi * Freq), initType = Modelica.Blocks.Types.Init.InitialOutput) annotation(Placement(visible = true, transformation(origin={0.763,
            -70},                                                                                                                                                                                                        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add3 annotation(Placement(visible = true, transformation(origin={37,
            -69.859},                                                                                        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 2 * C.pi * SysFreq) annotation(Placement(visible = true, transformation(origin={-50,-70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  OpenIWPI.Utilities.Integrators.IntegratorWithReset integrator1 annotation(Placement(visible = true, transformation(origin={70,
            -70},                                                                                                                         extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vD annotation(Placement(visible = true, transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput vQ annotation(Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Delta annotation(Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(vB, clarke_xform.v_B)
    annotation (Line(points={{-120,0},{-88,0}}, color={0,0,127}));
  connect(vA, clarke_xform.v_A) annotation (Line(points={{-120,70},{-94,70},{-94,
          7},{-88,7}}, color={0,0,127}));
  connect(vC, clarke_xform.v_C) annotation (Line(points={{-120,-70},{-94,-70},{-94,
          -7},{-88,-7}}, color={0,0,127}));
  connect(gain1.y, sogi_1.v_in) annotation (Line(points={{-39,30},{-39,30},{-32,
          30}},     color={0,0,127}));
  connect(gain2.y, sogi_2.v_in) annotation (Line(points={{-39,-30.02},{-38,-30.107},
          {-32,-30.107}}, color={0,0,127}));
  connect(sogi_1.v, add1.u1)
    annotation (Line(points={{-9,34},{0,34},{0,36},{8,36}}, color={0,0,127}));
  connect(sogi_1.qv, add2.u1) annotation (Line(points={{-9,26},{-4,26},{-4,-24},
          {8,-24}}, color={0,0,127}));
  connect(sogi_2.v, add1.u2) annotation (Line(points={{-9,-26.107},{0,-26.107},{
          0,24},{8,24}}, color={0,0,127}));
  connect(sogi_2.qv, add2.u2) annotation (Line(points={{-9,-34.107},{-4,-34.107},
          {-4,-36},{8,-36}}, color={0,0,127}));
  connect(add1.y, park_xform.v_alfa)
    annotation (Line(points={{31,30},{36,30},{36,4},{42,4}}, color={0,0,127}));
  connect(add2.y, park_xform.v_beta) annotation (Line(points={{31,-30},{36,-30},
          {36,-4},{42,-4}}, color={0,0,127}));
  connect(park_xform.v_d, vD) annotation (Line(points={{65,4},{80,4},{80,70},{110,
          70}}, color={0,0,127}));
  connect(park_xform.v_q, vQ) annotation (Line(points={{65,-4},{80,-4},{80,0},{110,
          0}}, color={0,0,127}));
  connect(park_xform.v_q, pi.u) annotation (Line(points={{65,-4},{80,-4},{80,-50},
          {-20,-50},{-20,-70},{-11.237,-70}}, color={0,0,127}));
  connect(integrator1.y, Delta) annotation (Line(points={{81,-70},{81,-70},{110,
          -70}},     color={0,0,127}));
  connect(add3.y, integrator1.u) annotation (Line(points={{48,-69.859},{48,-70},
          {58,-70}}, color={0,0,127}));
  connect(pi.y, add3.u1) annotation (Line(points={{11.763,-70},{18,-70},{18,
          -63.859},{25,-63.859}}, color={0,0,127}));
  connect(const.y, add3.u2) annotation (Line(points={{-39,-70},{-28,-70},{-28,
          -90},{18,-90},{18,-75.859},{25,-75.859}}, color={0,0,127}));
  connect(integrator1.y, park_xform.delta) annotation (Line(points={{81,-70},{
          90,-70},{90,-28},{54,-28},{54,-12}}, color={0,0,127}));
  connect(clarke_xform.v_alfa, gain1.u) annotation (Line(points={{-65,4},{-60,4},
          {-60,18},{-68,18},{-68,30},{-62,30}}, color={0,0,127}));
  connect(clarke_xform.v_beta, gain2.u) annotation (Line(points={{-65,-4},{-60,
          -4},{-60,-18},{-68,-18},{-68,-30.02},{-62,-30.02}}, color={0,0,127}));
end Dsogi;
