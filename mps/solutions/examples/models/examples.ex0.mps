<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:85987500-ec3f-404a-b73a-cc3f3a1ce869(examples.ex0)">
  <persistence version="9" />
  <languages>
    <use id="88260bd7-f440-4eca-9873-12d94cb6e747" name="PowerBudget" version="0" />
    <use id="daeaf3e0-0c1d-4bee-941e-b0a10169a7a6" name="Finding" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="88260bd7-f440-4eca-9873-12d94cb6e747" name="PowerBudget">
      <concept id="1002563151016780188" name="PowerBudget.structure.IPowerParticipant" flags="ng" index="3cEr13">
        <property id="1002563151016780184" name="continuous" index="3cEr17" />
        <property id="1002563151016780181" name="peak" index="3cEr1a" />
      </concept>
      <concept id="1002563151016780164" name="PowerBudget.structure.PowerSource" flags="ng" index="3cEr1r">
        <property id="1002563151016780167" name="kind" index="3cEr1o" />
      </concept>
      <concept id="1002563151016780195" name="PowerBudget.structure.PowerConsumer" flags="ng" index="3cEr1W">
        <child id="1002563151016885647" name="providedFrom" index="3cE2Lg" />
      </concept>
      <concept id="1002563151016780466" name="PowerBudget.structure.ProvidedFrom" flags="ng" index="3cErdH">
        <reference id="1002563151016780469" name="source" index="3cErdE" />
      </concept>
      <concept id="1002563151016701092" name="PowerBudget.structure.PowerModule" flags="ng" index="3cPJPV">
        <child id="1002563151016780063" name="contents" index="3cEr30" />
      </concept>
    </language>
    <language id="daeaf3e0-0c1d-4bee-941e-b0a10169a7a6" name="Finding">
      <concept id="7395118629968815447" name="Finding.structure.Finding" flags="ng" index="3_yDxx">
        <property id="7395118629968815463" name="message" index="3_yDxh" />
        <property id="7395118629968815461" name="severity" index="3_yDxj" />
        <property id="7395118629968919952" name="code" index="3_yK2A" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3cPJPV" id="RDOtZ1goTc">
    <property role="TrG5h" value="Voyager1" />
    <node concept="3cEr1r" id="RDOtZ1goTd" role="3cEr30">
      <property role="TrG5h" value="rtg0" />
      <property role="3cEr1o" value="RDOtZ1g66b/nuclear" />
      <property role="3cEr1a" value="370" />
      <property role="3cEr17" value="100" />
      <node concept="3_yDxx" id="6qwJjq3aVQ5" role="lGtFl">
        <property role="3_yDxj" value="6qwJjq3aylu/warning" />
        <property role="3_yDxh" value="Total peak of consumers (530) exceeds source peak" />
        <property role="3_yK2A" value="1" />
      </node>
    </node>
    <node concept="3cEr1W" id="RDOtZ1gvOQ" role="3cEr30">
      <property role="TrG5h" value="comms" />
      <property role="3cEr1a" value="200" />
      <property role="3cEr17" value="0" />
      <node concept="3cErdH" id="6qwJjq39IwL" role="3cE2Lg">
        <ref role="3cErdE" node="RDOtZ1goTd" />
      </node>
    </node>
    <node concept="3cEr1W" id="RDOtZ1gvOo" role="3cEr30">
      <property role="TrG5h" value="sensorA" />
      <property role="3cEr1a" value="200" />
      <property role="3cEr17" value="15" />
      <node concept="3cErdH" id="6qwJjq3ayi0" role="3cE2Lg">
        <ref role="3cErdE" node="RDOtZ1goTd" />
      </node>
    </node>
    <node concept="3cEr1W" id="RDOtZ1gvP9" role="3cEr30">
      <property role="TrG5h" value="sensorB" />
      <property role="3cEr1a" value="130" />
      <property role="3cEr17" value="0" />
      <node concept="3cErdH" id="6qwJjq3ayi2" role="3cE2Lg">
        <ref role="3cErdE" node="RDOtZ1goTd" />
      </node>
    </node>
  </node>
</model>

