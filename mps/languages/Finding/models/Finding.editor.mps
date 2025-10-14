<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:9f9c5c9a-041b-4af4-9cfd-26085521ca0c(Finding.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="o4fq" ref="r:5ae8ca5b-ca58-4427-914a-bc856c99c28f(Finding.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi">
        <child id="1078153129734" name="inspectedCellModel" index="6VMZX" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1142886221719" name="jetbrains.mps.lang.editor.structure.QueryFunction_NodeCondition" flags="in" index="pkWqt" />
      <concept id="1142886811589" name="jetbrains.mps.lang.editor.structure.ConceptFunctionParameter_node" flags="nn" index="pncrf" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1239814640496" name="jetbrains.mps.lang.editor.structure.CellLayout_VerticalGrid" flags="nn" index="2EHx9g" />
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1149850725784" name="jetbrains.mps.lang.editor.structure.CellModel_AttributedNodeCell" flags="ng" index="2SsqMj" />
      <concept id="1186403694788" name="jetbrains.mps.lang.editor.structure.ColorStyleClassItem" flags="ln" index="VaVBg">
        <property id="1186403713874" name="color" index="Vb096" />
      </concept>
      <concept id="1186404574412" name="jetbrains.mps.lang.editor.structure.BackgroundColorStyleClassItem" flags="ln" index="Veino" />
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
      </concept>
      <concept id="1073389214265" name="jetbrains.mps.lang.editor.structure.EditorCellModel" flags="ng" index="3EYTF0">
        <child id="1142887637401" name="renderingCondition" index="pqm2j" />
      </concept>
      <concept id="1073389446423" name="jetbrains.mps.lang.editor.structure.CellModel_Collection" flags="sn" stub="3013115976261988961" index="3EZMnI">
        <child id="1106270802874" name="cellLayout" index="2iSdaV" />
        <child id="1073389446424" name="childCellModel" index="3EZMnx" />
      </concept>
      <concept id="1073389577006" name="jetbrains.mps.lang.editor.structure.CellModel_Constant" flags="sn" stub="3610246225209162225" index="3F0ifn">
        <property id="1073389577007" name="text" index="3F0ifm" />
      </concept>
      <concept id="1073389658414" name="jetbrains.mps.lang.editor.structure.CellModel_Property" flags="sg" stub="730538219796134133" index="3F0A7n" />
      <concept id="1219418625346" name="jetbrains.mps.lang.editor.structure.IStyleContainer" flags="ng" index="3F0Thp">
        <child id="1219418656006" name="styleItem" index="3F10Kt" />
      </concept>
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="4705942098322609812" name="jetbrains.mps.lang.smodel.structure.EnumMember_IsOperation" flags="ng" index="21noJN">
        <child id="4705942098322609813" name="member" index="21noJM" />
      </concept>
      <concept id="4705942098322467729" name="jetbrains.mps.lang.smodel.structure.EnumMemberReference" flags="ng" index="21nZrQ">
        <reference id="4705942098322467736" name="decl" index="21nZrZ" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="6qwJjq3ayml">
    <ref role="1XX52x" to="o4fq:6qwJjq3ayln" resolve="Finding" />
    <node concept="3EZMnI" id="6qwJjq3aymn" role="2wV5jI">
      <node concept="3F0ifn" id="6qwJjq3aym_" role="3EZMnx">
        <property role="3F0ifm" value="*" />
        <node concept="Veino" id="6qwJjq3aymF" role="3F10Kt">
          <property role="Vb096" value="hGRnIZc/lightBlue" />
        </node>
        <node concept="pkWqt" id="6qwJjq3aymI" role="pqm2j">
          <node concept="3clFbS" id="6qwJjq3aymJ" role="2VODD2">
            <node concept="3clFbF" id="6qwJjq3ayqI" role="3cqZAp">
              <node concept="2OqwBi" id="6qwJjq3az3b" role="3clFbG">
                <node concept="2OqwBi" id="6qwJjq3ayD9" role="2Oq$k0">
                  <node concept="pncrf" id="6qwJjq3ayqH" role="2Oq$k0" />
                  <node concept="3TrcHB" id="6qwJjq3ayPK" role="2OqNvi">
                    <ref role="3TsBF5" to="o4fq:6qwJjq3ayl_" resolve="severity" />
                  </node>
                </node>
                <node concept="21noJN" id="6qwJjq3azep" role="2OqNvi">
                  <node concept="21nZrQ" id="6qwJjq3azer" role="21noJM">
                    <ref role="21nZrZ" to="o4fq:6qwJjq3aylt" resolve="info" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="6qwJjq3azn9" role="3EZMnx">
        <property role="3F0ifm" value="*" />
        <node concept="Veino" id="6qwJjq3azna" role="3F10Kt">
          <property role="Vb096" value="fLwANPq/yellow" />
        </node>
        <node concept="pkWqt" id="6qwJjq3aznb" role="pqm2j">
          <node concept="3clFbS" id="6qwJjq3aznc" role="2VODD2">
            <node concept="3clFbF" id="6qwJjq3aznd" role="3cqZAp">
              <node concept="2OqwBi" id="6qwJjq3azne" role="3clFbG">
                <node concept="2OqwBi" id="6qwJjq3aznf" role="2Oq$k0">
                  <node concept="pncrf" id="6qwJjq3azng" role="2Oq$k0" />
                  <node concept="3TrcHB" id="6qwJjq3aznh" role="2OqNvi">
                    <ref role="3TsBF5" to="o4fq:6qwJjq3ayl_" resolve="severity" />
                  </node>
                </node>
                <node concept="21noJN" id="6qwJjq3azni" role="2OqNvi">
                  <node concept="21nZrQ" id="6qwJjq3aznj" role="21noJM">
                    <ref role="21nZrZ" to="o4fq:6qwJjq3aylu" resolve="warning" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="6qwJjq3aznG" role="3EZMnx">
        <property role="3F0ifm" value="*" />
        <node concept="Veino" id="6qwJjq3aznH" role="3F10Kt">
          <property role="Vb096" value="fLwANPn/red" />
        </node>
        <node concept="pkWqt" id="6qwJjq3aznI" role="pqm2j">
          <node concept="3clFbS" id="6qwJjq3aznJ" role="2VODD2">
            <node concept="3clFbF" id="6qwJjq3aznK" role="3cqZAp">
              <node concept="2OqwBi" id="6qwJjq3aznL" role="3clFbG">
                <node concept="2OqwBi" id="6qwJjq3aznM" role="2Oq$k0">
                  <node concept="pncrf" id="6qwJjq3aznN" role="2Oq$k0" />
                  <node concept="3TrcHB" id="6qwJjq3aznO" role="2OqNvi">
                    <ref role="3TsBF5" to="o4fq:6qwJjq3ayl_" resolve="severity" />
                  </node>
                </node>
                <node concept="21noJN" id="6qwJjq3aznP" role="2OqNvi">
                  <node concept="21nZrQ" id="6qwJjq3aznQ" role="21noJM">
                    <ref role="21nZrZ" to="o4fq:6qwJjq3aylx" resolve="error" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2SsqMj" id="6qwJjq3aymx" role="3EZMnx" />
      <node concept="2iRfu4" id="6qwJjq3aymq" role="2iSdaV" />
    </node>
    <node concept="3EZMnI" id="6qwJjq3aW6h" role="6VMZX">
      <node concept="2iRkQZ" id="6qwJjq3aW6i" role="2iSdaV" />
      <node concept="PMmxH" id="6qwJjq3aW8d" role="3EZMnx">
        <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
      </node>
      <node concept="3F0ifn" id="6qwJjq3aW8k" role="3EZMnx" />
      <node concept="3EZMnI" id="6qwJjq3aW8r" role="3EZMnx">
        <node concept="VPM3Z" id="6qwJjq3aW8t" role="3F10Kt" />
        <node concept="3EZMnI" id="6qwJjq3aW8E" role="3EZMnx">
          <node concept="VPM3Z" id="6qwJjq3aW8G" role="3F10Kt" />
          <node concept="3F0ifn" id="6qwJjq3aW8I" role="3EZMnx">
            <property role="3F0ifm" value="code" />
          </node>
          <node concept="3XFhqQ" id="6qwJjq3aW8Z" role="3EZMnx" />
          <node concept="3F0A7n" id="6qwJjq3aW97" role="3EZMnx">
            <ref role="1NtTu8" to="o4fq:6qwJjq3aVQg" resolve="code" />
          </node>
          <node concept="2iRfu4" id="6qwJjq3aW8J" role="2iSdaV" />
        </node>
        <node concept="3EZMnI" id="6qwJjq3aW9c" role="3EZMnx">
          <node concept="VPM3Z" id="6qwJjq3aW9d" role="3F10Kt" />
          <node concept="3F0ifn" id="6qwJjq3aW9e" role="3EZMnx">
            <property role="3F0ifm" value="severity" />
          </node>
          <node concept="3XFhqQ" id="6qwJjq3aW9f" role="3EZMnx" />
          <node concept="3F0A7n" id="6qwJjq3aW9g" role="3EZMnx">
            <ref role="1NtTu8" to="o4fq:6qwJjq3ayl_" resolve="severity" />
          </node>
          <node concept="2iRfu4" id="6qwJjq3aW9h" role="2iSdaV" />
        </node>
        <node concept="3EZMnI" id="6qwJjq3aW9u" role="3EZMnx">
          <node concept="VPM3Z" id="6qwJjq3aW9v" role="3F10Kt" />
          <node concept="3F0ifn" id="6qwJjq3aW9w" role="3EZMnx">
            <property role="3F0ifm" value="message" />
          </node>
          <node concept="3XFhqQ" id="6qwJjq3aW9x" role="3EZMnx" />
          <node concept="3F0A7n" id="6qwJjq3aW9y" role="3EZMnx">
            <ref role="1NtTu8" to="o4fq:6qwJjq3aylB" resolve="message" />
          </node>
          <node concept="2iRfu4" id="6qwJjq3aW9z" role="2iSdaV" />
        </node>
        <node concept="2EHx9g" id="6qwJjq3aW8B" role="2iSdaV" />
      </node>
    </node>
  </node>
</model>

