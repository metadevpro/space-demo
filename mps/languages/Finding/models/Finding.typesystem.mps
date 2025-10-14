<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:cd537346-b005-48a4-ad2f-5f870199009f(Finding.typesystem)">
  <persistence version="9" />
  <languages>
    <use id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem" version="5" />
    <devkit ref="00000000-0000-4000-0000-1de82b3a4936(jetbrains.mps.devkit.aspect.typesystem)" />
  </languages>
  <imports>
    <import index="o4fq" ref="r:5ae8ca5b-ca58-4427-914a-bc856c99c28f(Finding.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="7a5dda62-9140-4668-ab76-d5ed1746f2b2" name="jetbrains.mps.lang.typesystem">
      <concept id="1207055528241" name="jetbrains.mps.lang.typesystem.structure.WarningStatement" flags="nn" index="a7r0C">
        <child id="1207055552304" name="warningText" index="a7wSD" />
      </concept>
      <concept id="1224760201579" name="jetbrains.mps.lang.typesystem.structure.InfoStatement" flags="nn" index="Dpp1Q">
        <child id="1224760230762" name="infoText" index="Dpw9R" />
      </concept>
      <concept id="1175517767210" name="jetbrains.mps.lang.typesystem.structure.ReportErrorStatement" flags="nn" index="2MkqsV">
        <child id="1175517851849" name="errorString" index="2MkJ7o" />
      </concept>
      <concept id="1195213580585" name="jetbrains.mps.lang.typesystem.structure.AbstractCheckingRule" flags="ig" index="18hYwZ">
        <child id="1195213635060" name="body" index="18ibNy" />
      </concept>
      <concept id="1195214364922" name="jetbrains.mps.lang.typesystem.structure.NonTypesystemRule" flags="ig" index="18kY7G" />
      <concept id="3937244445246642777" name="jetbrains.mps.lang.typesystem.structure.AbstractReportStatement" flags="ng" index="1urrMJ">
        <child id="3937244445246642781" name="nodeToReport" index="1urrMF" />
      </concept>
      <concept id="1174642788531" name="jetbrains.mps.lang.typesystem.structure.ConceptReference" flags="ig" index="1YaCAy">
        <reference id="1174642800329" name="concept" index="1YaFvo" />
      </concept>
      <concept id="1174648085619" name="jetbrains.mps.lang.typesystem.structure.AbstractRule" flags="ng" index="1YuPPy">
        <child id="1174648101952" name="applicableNode" index="1YuTPh" />
      </concept>
      <concept id="1174650418652" name="jetbrains.mps.lang.typesystem.structure.ApplicableNodeReference" flags="nn" index="1YBJjd">
        <reference id="1174650432090" name="applicableNode" index="1YBMHb" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="4705942098322467729" name="jetbrains.mps.lang.smodel.structure.EnumMemberReference" flags="ng" index="21nZrQ">
        <reference id="4705942098322467736" name="decl" index="21nZrZ" />
      </concept>
      <concept id="1139613262185" name="jetbrains.mps.lang.smodel.structure.Node_GetParentOperation" flags="nn" index="1mfA1w" />
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="2453008993612717257" name="jetbrains.mps.lang.smodel.structure.EnumSwitchCaseBody_StatementList" flags="ng" index="3X5gDB">
        <child id="2453008993612717258" name="statementList" index="3X5gD$" />
      </concept>
      <concept id="2453008993612559843" name="jetbrains.mps.lang.smodel.structure.EnumSwitchCase" flags="ng" index="3X5Udd">
        <child id="2453008993612717146" name="body" index="3X5gFO" />
        <child id="2453008993612559844" name="members" index="3X5Uda" />
      </concept>
      <concept id="2453008993612559839" name="jetbrains.mps.lang.smodel.structure.EnumSwitchExpression" flags="ng" index="3X5UdL">
        <child id="2453008993612714935" name="cases" index="3X5gkp" />
        <child id="2453008993612559840" name="enumExpression" index="3X5Ude" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="18kY7G" id="6qwJjq3azKy">
    <property role="TrG5h" value="check_Finding" />
    <node concept="3clFbS" id="6qwJjq3azKz" role="18ibNy">
      <node concept="3clFbF" id="6qwJjq3azKF" role="3cqZAp">
        <node concept="3X5UdL" id="6qwJjq3azKD" role="3clFbG">
          <node concept="2OqwBi" id="6qwJjq3azUf" role="3X5Ude">
            <node concept="1YBJjd" id="6qwJjq3azKS" role="2Oq$k0">
              <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
            </node>
            <node concept="3TrcHB" id="6qwJjq3a$3Y" role="2OqNvi">
              <ref role="3TsBF5" to="o4fq:6qwJjq3ayl_" resolve="severity" />
            </node>
          </node>
          <node concept="3X5Udd" id="6qwJjq3a$6s" role="3X5gkp">
            <node concept="21nZrQ" id="6qwJjq3a$6r" role="3X5Uda">
              <ref role="21nZrZ" to="o4fq:6qwJjq3aylt" resolve="info" />
            </node>
            <node concept="3X5gDB" id="6qwJjq3a$71" role="3X5gFO">
              <node concept="3clFbS" id="6qwJjq3a$74" role="3X5gD$">
                <node concept="Dpp1Q" id="6qwJjq3a$7e" role="3cqZAp">
                  <node concept="2OqwBi" id="6qwJjq3a$ij" role="Dpw9R">
                    <node concept="1YBJjd" id="6qwJjq3a$7z" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="3TrcHB" id="6qwJjq3a$w9" role="2OqNvi">
                      <ref role="3TsBF5" to="o4fq:6qwJjq3aylB" resolve="message" />
                    </node>
                  </node>
                  <node concept="2OqwBi" id="6qwJjq3a$Ga" role="1urrMF">
                    <node concept="1YBJjd" id="6qwJjq3a$yR" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="1mfA1w" id="6qwJjq3a$Rd" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3X5Udd" id="6qwJjq3a$S0" role="3X5gkp">
            <node concept="21nZrQ" id="6qwJjq3a$S1" role="3X5Uda">
              <ref role="21nZrZ" to="o4fq:6qwJjq3aylu" resolve="warning" />
            </node>
            <node concept="3X5gDB" id="6qwJjq3a$S2" role="3X5gFO">
              <node concept="3clFbS" id="6qwJjq3a$S3" role="3X5gD$">
                <node concept="a7r0C" id="6qwJjq3a$UI" role="3cqZAp">
                  <node concept="2OqwBi" id="6qwJjq3a$UK" role="a7wSD">
                    <node concept="1YBJjd" id="6qwJjq3a$UL" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="3TrcHB" id="6qwJjq3a$UM" role="2OqNvi">
                      <ref role="3TsBF5" to="o4fq:6qwJjq3aylB" resolve="message" />
                    </node>
                  </node>
                  <node concept="2OqwBi" id="6qwJjq3a$UN" role="1urrMF">
                    <node concept="1YBJjd" id="6qwJjq3a$UO" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="1mfA1w" id="6qwJjq3a$UP" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3X5Udd" id="6qwJjq3a$Sx" role="3X5gkp">
            <node concept="21nZrQ" id="6qwJjq3a$Sy" role="3X5Uda">
              <ref role="21nZrZ" to="o4fq:6qwJjq3aylx" resolve="error" />
            </node>
            <node concept="3X5gDB" id="6qwJjq3a$Sz" role="3X5gFO">
              <node concept="3clFbS" id="6qwJjq3a$S$" role="3X5gD$">
                <node concept="2MkqsV" id="6qwJjq3a$Yq" role="3cqZAp">
                  <node concept="2OqwBi" id="6qwJjq3a$Ys" role="2MkJ7o">
                    <node concept="1YBJjd" id="6qwJjq3a$Yt" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="3TrcHB" id="6qwJjq3a$Yu" role="2OqNvi">
                      <ref role="3TsBF5" to="o4fq:6qwJjq3aylB" resolve="message" />
                    </node>
                  </node>
                  <node concept="2OqwBi" id="6qwJjq3a$Yv" role="1urrMF">
                    <node concept="1YBJjd" id="6qwJjq3a$Yw" role="2Oq$k0">
                      <ref role="1YBMHb" node="6qwJjq3azK_" resolve="finding" />
                    </node>
                    <node concept="1mfA1w" id="6qwJjq3a$Yx" role="2OqNvi" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="1YaCAy" id="6qwJjq3azK_" role="1YuTPh">
      <property role="TrG5h" value="finding" />
      <ref role="1YaFvo" to="o4fq:6qwJjq3ayln" resolve="Finding" />
    </node>
  </node>
</model>

