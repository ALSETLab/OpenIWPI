within OpenIWPI.Examples;
model SimpleCircuit "Example showing the wave-phasor interface on a two-bus system"
 extends Modelica.Icons.Example;
 OpenIPSL.Electrical.Buses.Bus bus1(v_0=1.1265)
    annotation (Placement(transformation(extent={{-30,40},{-10,60}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus1(
    v_0=1.1265,
    angle_0=0,
    P_0=0,
    Q_0=0,
    displayPF=true)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60, S_b(displayUnit="MVA") = 100000000)
    annotation (Placement(transformation(extent={{-100,80},{-58,100}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus2(angle_0=-2.4073, displayPF
      =true)
    annotation (Placement(transformation(extent={{60,40},{40,60}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{10,40},{30,60}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.2625,
    X=0.099,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-10,40},{10,60}})));
 OpenIPSL.Electrical.Buses.Bus bus3(v_0=1.1265)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus3(
    v_0=1.1265,
    angle_0=0,
    P_0=0,
    Q_0=0,
    displayPF=true)
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Buses.Dsogi_hybrid dsogi_hybrid(Vb=138000)
    annotation (Placement(transformation(extent={{-34,-40},{-14,-20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-34,-86},{-14,-66}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=50)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=50)
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=50)
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor3(i(fixed=true), L=0.05)
    annotation (Placement(transformation(extent={{30,-60},{50,-40}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(fixed=true), L=0.05)
    annotation (Placement(transformation(extent={{30,-20},{50,0}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(fixed=true), L=0.05)
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  Modelica.Electrical.Analog.Sources.SineVoltage phaseC( V=dsogi_hybrid.Vb * sqrt(2) / sqrt(3), f=SysData.fn)
    annotation (Placement(transformation(extent={{60,-60},{80,-40}})));
  Modelica.Electrical.Analog.Sources.SineVoltage phaseA( V=dsogi_hybrid.Vb * sqrt(2) / sqrt(3), f=SysData.fn)
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
  Modelica.Electrical.Analog.Sources.SineVoltage phaseB( V=dsogi_hybrid.Vb * sqrt(2) / sqrt(3), f=SysData.fn)
    annotation (Placement(transformation(extent={{60,-40},{80,-20}})));
equation
  connect(bus2.p,pwLine. n)
    annotation (Line(points={{20,50},{9,50}}, color={0,0,255}));
  connect(bus2.p,infiniteBus2. p)
    annotation (Line(points={{20,50},{40,50}},color={0,0,255}));
  connect(infiniteBus1.p, bus1.p)
    annotation (Line(points={{-40,50},{-20,50}}, color={0,0,255}));
  connect(bus1.p, pwLine.p)
    annotation (Line(points={{-20,50},{-9,50}}, color={0,0,255}));
  connect(infiniteBus3.p, bus3.p)
    annotation (Line(points={{-70,-30},{-50,-30}}, color={0,0,255}));
  connect(dsogi_hybrid.pwPin, bus3.p)
    annotation (Line(points={{-33,-30},{-50,-30}}, color={0,0,255}));
  connect(dsogi_hybrid.pin_grd, ground.p)
    annotation (Line(points={{-24,-39},{-24,-66}}, color={0,0,255}));
  connect(ground.p, phaseB.n) annotation (Line(points={{-24,-66},{90,-66},{90,-30},
          {80,-30}}, color={0,0,255}));
  connect(phaseC.n, phaseB.n) annotation (Line(points={{80,-50},{86,-50},{86,-30},
          {80,-30}}, color={0,0,255}));
  connect(phaseA.n, phaseB.n) annotation (Line(points={{80,-10},{86,-10},{86,-30},
          {80,-30}}, color={0,0,255}));
  connect(resistor2.p, dsogi_hybrid.pin_B)
    annotation (Line(points={{0,-30},{-15,-30}}, color={0,0,255}));
  connect(resistor1.n, inductor1.p)
    annotation (Line(points={{20,-10},{30,-10}}, color={0,0,255}));
  connect(resistor2.n, inductor2.p)
    annotation (Line(points={{20,-30},{30,-30}}, color={0,0,255}));
  connect(resistor3.n, inductor3.p)
    annotation (Line(points={{20,-50},{30,-50}}, color={0,0,255}));
  connect(inductor2.n, phaseB.p)
    annotation (Line(points={{50,-30},{60,-30}}, color={0,0,255}));
  connect(inductor1.n, phaseA.p)
    annotation (Line(points={{50,-10},{60,-10}}, color={0,0,255}));
  connect(inductor3.n, phaseC.p)
    annotation (Line(points={{50,-50},{60,-50}}, color={0,0,255}));
  connect(dsogi_hybrid.pin_A, resistor1.p) annotation (Line(points={{-15,-21},{-8,
          -21},{-8,-10},{0,-10}}, color={0,0,255}));
  connect(dsogi_hybrid.pin_C, resistor3.p) annotation (Line(points={{-15,-39},{-8,
          -39},{-8,-50},{0,-50}}, color={0,0,255}));
end SimpleCircuit;
