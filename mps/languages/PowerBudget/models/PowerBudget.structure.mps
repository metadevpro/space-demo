<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:5c10f8d5-6653-4a5d-ab56-d8d71b96e18b(PowerBudget.structure)">
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
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="5092175715804935370" name="conceptAlias" index="34LRSv" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ">
        <child id="1169127546356" name="extends" index="PrDN$" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
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
      <concept id="6461713321117473366" name="io.lionweb.mps.structure.attribute.structure.LionWebSmartReference" flags="ng" index="3Kckhh">
        <reference id="6461713321117473439" name="reference" index="3Kckio" />
      </concept>
      <concept id="6461713321120959620" name="io.lionweb.mps.structure.attribute.structure.LionWebPartitionConcept" flags="ng" index="3KvTa3">
        <property id="6461713321120959627" name="partition" index="3KvTac" />
      </concept>
    </language>
  </registry>
  <node concept="2DM1_0" id="RDOtZ1fx3L">
    <property role="2DM1AS" value="space-PowerBudget" />
    <property role="2NbWok" value="0.1" />
  </node>
  <node concept="1TIwiD" id="RDOtZ1fMM$">
    <property role="EcuMT" value="1002563151016701092" />
    <property role="TrG5h" value="PowerModule" />
    <property role="19KtqR" value="true" />
    <property role="34LRSv" value="Power Module" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="RDOtZ1g64r" role="PzmwI">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="3KvTa3" id="RDOtZ1g64t" role="lGtFl">
      <property role="3KvTac" value="true" />
    </node>
    <node concept="1TJgyj" id="RDOtZ1g64v" role="1TKVEi">
      <property role="IQ2ns" value="1002563151016780063" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="contents" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="RDOtZ1g64y" resolve="IPowerModuleContent" />
      <node concept="2DM1AW" id="RDOtZ1go_n" role="lGtFl">
        <property role="2DM1AS" value="PowerModule-contents" />
      </node>
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_d" role="lGtFl">
      <property role="2DM1AS" value="PowerModule" />
    </node>
  </node>
  <node concept="PlHQZ" id="RDOtZ1g64y">
    <property role="TrG5h" value="IPowerModuleContent" />
    <property role="EcuMT" value="1002563151016780065" />
    <node concept="PrWs8" id="RDOtZ1g64z" role="PrDN$">
      <ref role="PrY4T" to="tpck:h0TrEE$" resolve="INamedConcept" />
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_h" role="lGtFl">
      <property role="2DM1AS" value="IPowerModuleContent" />
    </node>
  </node>
  <node concept="1TIwiD" id="RDOtZ1g664">
    <property role="EcuMT" value="1002563151016780164" />
    <property role="TrG5h" value="PowerSource" />
    <property role="34LRSv" value="Source" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="RDOtZ1g665" role="PzmwI">
      <ref role="PrY4T" node="RDOtZ1g64y" resolve="IPowerModuleContent" />
    </node>
    <node concept="PrWs8" id="RDOtZ1g66t" role="PzmwI">
      <ref role="PrY4T" node="RDOtZ1g66s" resolve="IPowerParticipant" />
    </node>
    <node concept="1TJgyi" id="RDOtZ1g667" role="1TKVEl">
      <property role="IQ2nx" value="1002563151016780167" />
      <property role="TrG5h" value="kind" />
      <ref role="AX2Wp" node="RDOtZ1g669" resolve="PowerSourceKind" />
      <node concept="2DM1AW" id="RDOtZ1go_q" role="lGtFl">
        <property role="2DM1AS" value="PowerSource-kind" />
      </node>
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_e" role="lGtFl">
      <property role="2DM1AS" value="PowerSource" />
    </node>
  </node>
  <node concept="25R3W" id="RDOtZ1g669">
    <property role="3F6X1D" value="1002563151016780169" />
    <property role="TrG5h" value="PowerSourceKind" />
    <node concept="25R33" id="RDOtZ1g66a" role="25R1y">
      <property role="3tVfz5" value="1002563151016780170" />
      <property role="TrG5h" value="solar" />
      <node concept="2DM1AW" id="RDOtZ1go_k" role="lGtFl">
        <property role="2DM1AS" value="PowerSourceKind-solar" />
      </node>
    </node>
    <node concept="25R33" id="RDOtZ1g66b" role="25R1y">
      <property role="3tVfz5" value="1002563151016780171" />
      <property role="TrG5h" value="nuclear" />
      <node concept="2DM1AW" id="RDOtZ1go_l" role="lGtFl">
        <property role="2DM1AS" value="PowerSourceKind-nuclear" />
      </node>
    </node>
    <node concept="25R33" id="RDOtZ1g66e" role="25R1y">
      <property role="3tVfz5" value="1002563151016780174" />
      <property role="TrG5h" value="diesel" />
      <node concept="2DM1AW" id="RDOtZ1go_m" role="lGtFl">
        <property role="2DM1AS" value="PowerSourceKind-diesel" />
      </node>
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_j" role="lGtFl">
      <property role="2DM1AS" value="PowerSourceKind" />
    </node>
  </node>
  <node concept="PlHQZ" id="RDOtZ1g66s">
    <property role="EcuMT" value="1002563151016780188" />
    <property role="TrG5h" value="IPowerParticipant" />
    <node concept="1TJgyi" id="RDOtZ1g66l" role="1TKVEl">
      <property role="IQ2nx" value="1002563151016780181" />
      <property role="TrG5h" value="peak" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
      <node concept="2DM1AW" id="RDOtZ1go_r" role="lGtFl">
        <property role="2DM1AS" value="IPowerParticipant-peak" />
      </node>
    </node>
    <node concept="1TJgyi" id="RDOtZ1g66o" role="1TKVEl">
      <property role="IQ2nx" value="1002563151016780184" />
      <property role="TrG5h" value="continuous" />
      <ref role="AX2Wp" to="tpck:fKAQMTA" resolve="integer" />
      <node concept="2DM1AW" id="RDOtZ1go_s" role="lGtFl">
        <property role="2DM1AS" value="IPowerParticipant-continuous" />
      </node>
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_i" role="lGtFl">
      <property role="2DM1AS" value="IPowerParticipant" />
    </node>
  </node>
  <node concept="1TIwiD" id="RDOtZ1g66z">
    <property role="EcuMT" value="1002563151016780195" />
    <property role="TrG5h" value="PowerConsumer" />
    <property role="34LRSv" value="Consumer" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="PrWs8" id="RDOtZ1g66$" role="PzmwI">
      <ref role="PrY4T" node="RDOtZ1g64y" resolve="IPowerModuleContent" />
    </node>
    <node concept="PrWs8" id="RDOtZ1g66A" role="PzmwI">
      <ref role="PrY4T" node="RDOtZ1g66s" resolve="IPowerParticipant" />
    </node>
    <node concept="2DM1AW" id="RDOtZ1go_f" role="lGtFl">
      <property role="2DM1AS" value="PowerConsumer" />
    </node>
    <node concept="1TJgyj" id="RDOtZ1gvQf" role="1TKVEi">
      <property role="IQ2ns" value="1002563151016885647" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20kJfa" value="providedFrom" />
      <property role="20lbJX" value="fLJekj5/_0__n" />
      <ref role="20lvS9" node="RDOtZ1g6aM" resolve="ProvidedFrom" />
    </node>
  </node>
  <node concept="1TIwiD" id="RDOtZ1g6aM">
    <property role="EcuMT" value="1002563151016780466" />
    <property role="TrG5h" value="ProvidedFrom" />
    <ref role="1TJDcQ" to="tpck:gw2VY9q" resolve="BaseConcept" />
    <node concept="1TJgyj" id="RDOtZ1g6aP" role="1TKVEi">
      <property role="IQ2ns" value="1002563151016780469" />
      <property role="20kJfa" value="source" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="RDOtZ1g664" resolve="PowerSource" />
    </node>
    <node concept="3Kckhh" id="RDOtZ1gvQj" role="lGtFl">
      <ref role="3Kckio" node="RDOtZ1gvQf" resolve="providedFrom" />
    </node>
  </node>
</model>

