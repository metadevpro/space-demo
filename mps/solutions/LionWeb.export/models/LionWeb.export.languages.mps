<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:1a5d6e4a-8b6a-4cc0-acc1-0c8aeffd2377(LionWeb.export.languages)">
  <persistence version="9" />
  <languages>
    <use id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang" version="0" />
  </languages>
  <imports>
    <import index="cnx8" ref="r:85987500-ec3f-404a-b73a-cc3f3a1ce869(examples.ex0)" />
  </imports>
  <registry>
    <language id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang">
      <concept id="3631234780355719700" name="io.lionweb.mps.converter.lang.structure.NodeRef" flags="ng" index="pgsVv">
        <reference id="3631234780355720143" name="target" index="pgsW4" />
      </concept>
      <concept id="3631234780355716573" name="io.lionweb.mps.converter.lang.structure.ExportInstanceToJson" flags="ng" index="pgt$m">
        <property id="3631234780355961878" name="scope" index="pjpzt" />
        <child id="3631234780355719074" name="instances" index="pgtdD" />
      </concept>
      <concept id="5028875375328515028" name="io.lionweb.mps.converter.lang.structure.APathConverter" flags="ng" index="VS7hm">
        <property id="5028875375328515031" name="path" index="VS7hl" />
      </concept>
      <concept id="1622443184644647655" name="io.lionweb.mps.converter.lang.structure.ILanguageIdentityContainer" flags="ng" index="3IuRAt">
        <child id="5066961138993587939" name="languages" index="qeD2G" />
      </concept>
      <concept id="1622443184644647418" name="io.lionweb.mps.converter.lang.structure.ExportMpsLanguageToJson" flags="ng" index="3IuRE0">
        <property id="548682208089002477" name="scope" index="2G9pTy" />
        <property id="7815243479507244041" name="exportSpecialAnnotations" index="39gGq0" />
        <property id="6667649974506340416" name="exportDescriptionAnnotations" index="1_BS0j" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="3542851458883438784" name="jetbrains.mps.lang.smodel.structure.LanguageId" flags="nn" index="2V$Bhx">
        <property id="3542851458883439831" name="namespace" index="2V$B1Q" />
        <property id="3542851458883439832" name="languageId" index="2V$B1T" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3IuRE0" id="RDOtZ1f$Pe">
    <property role="TrG5h" value="SpaceDemo Languages" />
    <property role="VS7hl" value="${space-demo.home}/../chunks/space.languages.json" />
    <property role="2G9pTy" value="utjSYFIcjG/fineGrainedClosure" />
    <property role="1_BS0j" value="true" />
    <property role="39gGq0" value="true" />
    <node concept="2V$Bhx" id="RDOtZ1fJS8" role="qeD2G">
      <property role="2V$B1T" value="88260bd7-f440-4eca-9873-12d94cb6e747" />
      <property role="2V$B1Q" value="PowerBudget" />
    </node>
    <node concept="2V$Bhx" id="6qwJjq3aVQd" role="qeD2G">
      <property role="2V$B1T" value="daeaf3e0-0c1d-4bee-941e-b0a10169a7a6" />
      <property role="2V$B1Q" value="Finding" />
    </node>
  </node>
  <node concept="pgt$m" id="6qwJjq3ayi4">
    <property role="TrG5h" value="Export Voyager1" />
    <property role="VS7hl" value="${space-demo.home}/../chunks/voyager1.instance.json" />
    <property role="pjpzt" value="39$JcGFainl/descendants" />
    <node concept="pgsVv" id="6qwJjq3aylk" role="pgtdD">
      <ref role="pgsW4" to="cnx8:RDOtZ1goTc" />
    </node>
  </node>
</model>

