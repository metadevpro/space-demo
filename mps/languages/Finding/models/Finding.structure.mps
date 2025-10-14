<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:5ae8ca5b-ca58-4427-914a-bc856c99c28f(Finding.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <use id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute" version="0" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="3348158742936976480" name="jetbrains.mps.lang.structure.structure.EnumerationMemberDeclaration" flags="ng" index="25R33">
        <property id="1421157252384165432" name="memberId" index="3tVfz5" />
      </concept>
      <concept id="3348158742936976479" name="jetbrains.mps.lang.structure.structure.EnumerationDeclaration" flags="ng" index="25R3W">
        <child id="3348158742936976577" name="members" index="25R1y" />
      </concept>
      <concept id="6054523464626862044" name="jetbrains.mps.lang.structure.structure.AttributeInfo_IsMultiple" flags="ng" index="tn0Fv">
        <property id="6054523464626875854" name="value" index="tnX3d" />
      </concept>
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="2992811758677295509" name="jetbrains.mps.lang.structure.structure.AttributeInfo" flags="ng" index="M6xJ_">
        <property id="7588428831955550663" name="role" index="Hh88m" />
        <child id="7588428831955550186" name="multiple" index="HhnKV" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
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
    <language id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute">
      <concept id="7205279169712116346" name="io.lionweb.mps.structure.attribute.structure.LionWebLanguage" flags="ng" index="2DM1_0">
        <property id="7263087982341810717" name="version" index="2NbWok" />
      </concept>
      <concept id="7205279169712116353" name="io.lionweb.mps.structure.attribute.structure.ILionWebKey" flags="ng" index="2DM1AV">
        <property id="7205279169712116354" name="key" index="2DM1AS" />
      </concept>
      <concept id="7205279169712116358" name="io.lionweb.mps.structure.attribute.structure.LionWebEntityKey" flags="ng" index="2DM1AW" />
    </language>
  </registry>
  <node concept="1TIwiD" id="6qwJjq3ayln">
    <property role="EcuMT" value="7395118629968815447" />
    <property role="TrG5h" value="Finding" />
    <property role="34LRSv" value="Finding" />
    <ref role="1TJDcQ" to="tpck:2ULFgo8_XDk" resolve="NodeAttribute" />
    <node concept="M6xJ_" id="6qwJjq3aylo" role="lGtFl">
      <property role="Hh88m" value="findings" />
      <node concept="tn0Fv" id="6qwJjq3aylq" role="HhnKV">
        <property role="tnX3d" value="true" />
      </node>
    </node>
    <node concept="1TJgyi" id="6qwJjq3ayl_" role="1TKVEl">
      <property role="IQ2nx" value="7395118629968815461" />
      <property role="TrG5h" value="severity" />
      <ref role="AX2Wp" node="6qwJjq3ayls" resolve="Severity" />
      <node concept="2DM1AW" id="6qwJjq3aylK" role="lGtFl">
        <property role="2DM1AS" value="Finding-severity" />
      </node>
    </node>
    <node concept="1TJgyi" id="6qwJjq3aylB" role="1TKVEl">
      <property role="IQ2nx" value="7395118629968815463" />
      <property role="TrG5h" value="message" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6qwJjq3aylL" role="lGtFl">
        <property role="2DM1AS" value="Finding-message" />
      </node>
    </node>
    <node concept="1TJgyi" id="6qwJjq3aVQg" role="1TKVEl">
      <property role="IQ2nx" value="7395118629968919952" />
      <property role="TrG5h" value="code" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
      <node concept="2DM1AW" id="6qwJjq3aVQm" role="lGtFl">
        <property role="2DM1AS" value="Finding-code" />
      </node>
    </node>
    <node concept="2DM1AW" id="6qwJjq3aylF" role="lGtFl">
      <property role="2DM1AS" value="Finding" />
    </node>
  </node>
  <node concept="25R3W" id="6qwJjq3ayls">
    <property role="3F6X1D" value="7395118629968815452" />
    <property role="TrG5h" value="Severity" />
    <node concept="25R33" id="6qwJjq3aylt" role="25R1y">
      <property role="3tVfz5" value="7395118629968815453" />
      <property role="TrG5h" value="info" />
      <node concept="2DM1AW" id="6qwJjq3aylH" role="lGtFl">
        <property role="2DM1AS" value="Severity-info" />
      </node>
    </node>
    <node concept="25R33" id="6qwJjq3aylu" role="25R1y">
      <property role="3tVfz5" value="7395118629968815454" />
      <property role="TrG5h" value="warning" />
      <node concept="2DM1AW" id="6qwJjq3aylI" role="lGtFl">
        <property role="2DM1AS" value="Severity-warning" />
      </node>
    </node>
    <node concept="25R33" id="6qwJjq3aylx" role="25R1y">
      <property role="3tVfz5" value="7395118629968815457" />
      <property role="TrG5h" value="error" />
      <node concept="2DM1AW" id="6qwJjq3aylJ" role="lGtFl">
        <property role="2DM1AS" value="Severity-error" />
      </node>
    </node>
    <node concept="2DM1AW" id="6qwJjq3aylG" role="lGtFl">
      <property role="2DM1AS" value="Severity" />
    </node>
  </node>
  <node concept="2DM1_0" id="6qwJjq3aylE">
    <property role="2DM1AS" value="FindingLanguage" />
    <property role="2NbWok" value="0.1" />
  </node>
</model>

