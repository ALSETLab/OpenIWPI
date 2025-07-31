within OpenIWPI.UsersGuide;
model Overview "Overview"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The <strong><code>OpenIWPI</code></strong> has, basically, four packages:
Examples, Buses, Interfaces, and Utilities. They are briefly described below:
</p>

<ul>
<li><a href=\"modelica://OpenIWPI.Examples\">Examples</a> package for demonstrating the application of the interface using simple of power system examples for simulation.</li>
<li><a href=\"modelica://OpenIWPI.Buses\">Buses</a>: contains the electrical bus that uses the hybrid wave-phasor interface to connect phasor-based models with EMT-like models.</li>
<li><a href=\"modelica://OpenIWPI.Interfaces\">Interfaces</a>: contains the filter-based wave-phasor interface that allows the simulation of hybrid wave-phasor circuits.</li>
<li><a href=\"modelica://OpenIWPI.Utilities\">Utilities</a>: contains auxiliary models that are used in the library such as Phase Locked Loops, as well as Resettable and Second-Order Generalized Integrators.</li>
</ul>

<p>
The electrical bus found in the <a href=\"modelica://OpenIWPI.Buses\">Buses</a> subpackage allows the user to create part of a circuit using phasor-based models from the <code>OpenIPSL</code>, 
while other parts of the circuit can be assembled using the Electrical package within the <code>MSL</code>.
</p>

</html>"));
end Overview;