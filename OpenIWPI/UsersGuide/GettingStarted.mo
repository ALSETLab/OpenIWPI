within OpenIWPI.UsersGuide;
model GettingStarted "Getting Started"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The <strong><code>OpenIWPI</code></strong> was developed to be a tool helping engineers to simulate, at the same time, phasor-based and EMT-like circuits that are connected to each other.
The main idea is to be able to interface detailed components, using EMT-like representations, with power system grids, which are usually modeled in their phasor-domain positive-sequece equivalents.
The library can be helpful when studying interconnection impacts of power-electronic devices in power grids.  
</p>
<h4>Dependencies</h4>
<p>
The interface uses electrical connectors from the Open-Instance Power System Library - <code>OpenIPSL</code> and from the Modelica Standard Library - <code>MSL</code>. 
Therefore, the library is ideal for interconnecting phasor-based representations built using the <code>OpenIPSL</code> with EMT-like models that are built using the electrical 
library within the <code>MSL</code>. Note that the user will need to have both libraries (<code>OpenIPSL</code> and <code>MSL</code>) loaded before loading the <code>OpenIWPI</code> library. 
</p>

<h4>Power flow and Initialization</h4>
<p>
All models in a Modelica library require initial guess values that should come from a solution of
the steady state of the overall model. This initial guess for power system is called power flow.
However, there is no power flow solver associated to the library as of the present time. When building a use case, initialization of <code>OpenIPSL</code> variables must be performed with a power flow software.
Please review the initialization requirements for <code>OpenIPSL</code> models in its User's Guide.
The EMT-like portion of the system would be better initialized de-energized, and connectic as well as starting its operation at a positive time instant.
</p>
<h4>Running Time Domain Simulations</h4>
<p>
The time domain simulations are prepared to work with Modelica-compliant tools.
Users of the <strong><code>OpenIWPI</code></strong> are free to choose their tool of choice. 
However, note that the development of <strong><code>OpenIWPI</code></strong> has been carried out using <a href=\"http://www.3ds.com/products-services/catia/products/dymola\">Dymola</a>, 
and it might be possible to face issues when using other <a href=\"https://modelica.org/tools\">Modelica Tools</a> that we have not fully tested.
</p>
</html>"));
end GettingStarted;