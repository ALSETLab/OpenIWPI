package OpenIWPI "Open-Instance Wave-Phasor Interface Library"
  import         OpenIPSL.Types;
  import C = Modelica.Constants;

annotation (preferredView="info",
  Protection(access = Access.packageDuplicate),
  uses(Complex(version="4.0.0"), Modelica(version="4.0.0")),
  version="0.1.0-dev",
  Documentation(info="<html>
<p>
The <strong><code>OpenIWPI</code></strong> or Open-Instance Wave-Phasor Interface Library is a
<a href=\"https://www.modelica.org\">Modelica</a> library,
developed and maintained by the <a href=\"https://alsetlab.github.io/\">ALSETLab</a> research group,
collaborators and friends (contributions are welcome!).
The library contains a set of models that can be used to interconnect electromagnetic transient models to phasor-based power system components of OpenIPSL.
</p>
</html>"));
end OpenIWPI;
