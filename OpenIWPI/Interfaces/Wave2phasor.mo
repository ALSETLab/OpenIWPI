within OpenIWPI.Interfaces;
model Wave2phasor "This model allows the wave-phasor interface between electromagnetic models and OpenIPSL using SOGI filter input."
      extends Modelica.Electrical.PowerConverters.Icons.Converter;
      // Pins for wave signal:
      Modelica.Electrical.Analog.Interfaces.PositivePin PinA annotation (Placement(transformation(extent={{80,70},{100,90}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin PinB annotation (Placement(transformation(extent={{80,-10},{100,10}})));
      Modelica.Electrical.Analog.Interfaces.PositivePin PinC annotation (Placement(transformation(extent={{80,-90},{100,-70}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin PinGrd annotation (Placement(transformation(extent={{-10,-100},{10,-80}})));
      // Pin for phasor signal:
      OpenIPSL.Interfaces.PwPin PSPin annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
      // Pins for filtering:
      Modelica.Blocks.Interfaces.RealInput iapos annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,120}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-80,120})));
      Modelica.Blocks.Interfaces.RealInput ibpos annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-20,120}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-20,120})));
      Modelica.Blocks.Interfaces.RealOutput ialpha annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={20,110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={20,110})));
      Modelica.Blocks.Interfaces.RealOutput ibeta annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,110})));
      // Parameters:
      parameter Types.ApparentPower S_b(displayUnit="MVA")=100e6  "System base power"  annotation (Dialog(group="Power system data", enable=enableS_b));
      parameter Types.Voltage V_b(displayUnit="kV")=400e3 "Base voltage of the bus"  annotation (Dialog(group="Power system data", enable=enableV_b));
      parameter Types.Frequency fn(displayUnit="Hz")=60  "System frequency"  annotation (Dialog(group="Power system data", enable=enablefn));
      //Importing PLL:
      OpenIWPI.Utilities.PhaseLockedLoop.Dsogi pll(SysFreq = fn,VLine = V_b);
      Modelica.Blocks.Continuous.Derivative derA(T=0.1,initType=Modelica.Blocks.Types.Init.InitialOutput,y_start=0);
    protected
      Types.Voltage MagV; // voltage magnitude
      Types.Angle AngV; // voltage angle
      Types.PerUnit ir; // real part of current in phasor domain
      Types.PerUnit ii; // imaginary part of current in phasor domain
      Types.PerUnit MagI; // current magnitude in phasor domain
      Types.Angle AngIV; // voltage angle
      Types.AngularVelocity w;
equation
      // ----- Frequency
      derA.u = AngV;
      w = 2*C.pi*fn+derA.y;
      // ----- Current equations:
      PinGrd.i = -PinA.i-PinB.i-PinC.i;
      // Calculating Clarke transformation and filtering fundamental component:
      ialpha = (0.5)*(2/3)*(PinA.i - (1/2)*PinB.i - (1/2)*PinC.i);
      ibeta = (0.5)*(2/3)*((sqrt(3)/2)*PinB.i - (sqrt(3)/2)*PinC.i);
      // Real and imaginary parts of the current for phasor using Park transf.:
      ir= -sqrt(3/2)*(V_b/S_b)*(iapos*Modelica.Math.cos(pll.Delta)+ibpos*Modelica.Math.sin(pll.Delta));
      ii= -sqrt(3/2)*(V_b/S_b)*(-iapos*Modelica.Math.sin(pll.Delta)+ibpos*Modelica.Math.cos(pll.Delta));
      // Calculating magnitude and angle iv of current phasor:
      MagI = smooth(1, noEvent(if time<0.01 then C.eps else sqrt(ii^2 +ir^2)));
      AngIV = smooth(1, noEvent(if time<0.01 then C.eps else Modelica.Math.atan2(ii,ir)));
      // Calculating current phasor:
      PSPin.ii = MagI*Modelica.Math.sin(AngIV+AngV);
      PSPin.ir = MagI*Modelica.Math.cos(AngIV+AngV);
      // ----- Voltage equations:
      // Magnitude and angle for voltage signal:
      MagV = V_b*sqrt(PSPin.vr^2 + PSPin.vi^2);
      AngV = Modelica.Math.atan2(PSPin.vi,PSPin.vr);
      // Voltage difference between two nodes:
      PinA.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(w*time+AngV);
      PinB.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(w*time+AngV-2*C.pi/3);
      PinC.v-PinGrd.v = MagV*sqrt(2/3)*Modelica.Math.sin(w*time+AngV+2*C.pi/3);
      // Input for voltage PLL:
      pll.vA = PinA.v-PinGrd.v;
      pll.vB = PinB.v-PinGrd.v;
      pll.vC = PinC.v-PinGrd.v;
      annotation (Icon(graphics={Text(
              extent={{-72,74},{0,40}},
              lineColor={0,0,0},
              textString="Phasor"), Text(
              extent={{0,-22},{72,-56}},
              lineColor={0,0,0},
              textString="Wave")}));
end Wave2phasor;
