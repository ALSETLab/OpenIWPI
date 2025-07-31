within OpenIWPI.Buses;
model Dsogi_hybrid "Hybrid Phasor-Wave bus using a Double SOGI filter"
      extends Modelica.Electrical.PowerConverters.Icons.Converter;
        // ----- Parameters for the interface:
      parameter Types.ApparentPower Sb(displayUnit="MVA")=100e6
        "System base power"
        annotation (Dialog(group="Power system data", enable=enableSb));
      parameter Types.Voltage Vb(displayUnit="kV")=400e3
        "Base voltage of the bus"
        annotation (Dialog(group="Power system data", enable=enableVb));
      parameter Types.Frequency fs(displayUnit="Hz")=60
        "System frequency"
        annotation (Dialog(group="Power system data", enable=enablefs));
      parameter Real Kf=1.4142
        "Alfa and Beta filter gain"
        annotation (Dialog(group="Filter parameters", enable=enableKf));
      OpenIWPI.Interfaces.Wave2phasor wave2phasor(S_b=Sb,V_b=Vb,fn=fs)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        // ----- Pin OpenIPSL:
      OpenIPSL.Interfaces.PwPin pwPin
        annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
        // ----- Pins for MicroGrid:
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_A
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_B
        annotation (Placement(transformation(extent={{80,-10},{100,10}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_C
        annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_grd
        annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
        // ----- Filters for alfa and beta:
      OpenIWPI.Utilities.Integrators.Sogi sogi_alpha(FilterGain = Kf,FrequencyHz=fs)
        annotation (Placement(transformation(extent={{-2,86},{-22,66}})));
      OpenIWPI.Utilities.Integrators.Sogi sogi_beta(FilterGain = Kf,FrequencyHz=fs)
        annotation (Placement(transformation(extent={{-2,44},{-22,64}})));
        // ----- Composition for positive sequence:
      Modelica.Blocks.Math.Add add_apos(k2=-1)
        annotation (Placement(transformation(extent={{-46,50},{-66,70}})));
      Modelica.Blocks.Math.Add add_bpos
        annotation (Placement(transformation(extent={{-46,74},{-66,94}})));
    equation
      connect(wave2phasor.PinC, pin_C) annotation (Line(points={{9,-8},{32,-8},{32,-90},
              {90,-90}}, color={0,0,255}));
      connect(wave2phasor.PinB, pin_B)
        annotation (Line(points={{9,0},{90,0}}, color={0,0,255}));
      connect(wave2phasor.PinA, pin_A)
        annotation (Line(points={{9,8},{32,8},{32,90},{90,90}}, color={0,0,255}));
      connect(pwPin, wave2phasor.PSPin)
        annotation (Line(points={{-90,0},{-9,0}}, color={0,0,255}));
      connect(wave2phasor.PinGrd, pin_grd)
        annotation (Line(points={{0,-9},{0,-90}}, color={0,0,255}));
      connect(sogi_beta.v_in, wave2phasor.ibeta) annotation (Line(points={{-2.3441,53.7934},
              {6,53.7934},{6,9.8}},                color={0,0,127}));
      connect(sogi_alpha.v_in, wave2phasor.ialpha) annotation (Line(points={{-2.3441,
              76.2066},{2,76.2066},{2,9.8}},       color={0,0,127}));
      connect(add_apos.u2,sogi_beta. qv) annotation (Line(points={{-44,54},{-34,54},
              {-34,49},{-22,49}}, color={0,0,127}));
      connect(add_apos.y, wave2phasor.iapos) annotation (Line(points={{-67,60},{-74,
              60},{-74,22},{-6,22},{-6,9.4}},       color={0,0,127}));
      connect(add_bpos.u2,sogi_beta. v) annotation (Line(points={{-44,78},{-34,78},{
              -34,59},{-22,59}},  color={0,0,127}));
      connect(sogi_alpha.v,add_apos. u1) annotation (Line(points={{-22,71},{-28,71},{
              -28,66},{-44,66}},  color={0,0,127}));
      connect(add_bpos.y, wave2phasor.ibpos) annotation (Line(points={{-67,84},{-80,
              84},{-80,40},{-2,40},{-2,9.4}},       color={0,0,127}));
      connect(add_bpos.u1, sogi_alpha.qv) annotation (Line(points={{-44,90},{-28,90},
              {-28,81},{-22,81}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Dsogi_hybrid;