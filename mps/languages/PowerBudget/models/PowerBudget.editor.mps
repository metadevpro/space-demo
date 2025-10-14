<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:a0ebc0bb-fd13-4a3b-bb91-4ce719ccffd1(PowerBudget.editor)">
  <persistence version="9" />
  <languages>
    <use id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor" version="14" />
    <use id="aee9cad2-acd4-4608-aef2-0004f6a1cdbd" name="jetbrains.mps.lang.actions" version="4" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="gous" ref="r:5c10f8d5-6653-4a5d-ab56-d8d71b96e18b(PowerBudget.structure)" implicit="true" />
    <import index="tpco" ref="r:00000000-0000-4000-0000-011c89590284(jetbrains.mps.lang.core.editor)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="18bc6592-03a6-4e29-a83a-7ff23bde13ba" name="jetbrains.mps.lang.editor">
      <concept id="1071666914219" name="jetbrains.mps.lang.editor.structure.ConceptEditorDeclaration" flags="ig" index="24kQdi" />
      <concept id="1140524381322" name="jetbrains.mps.lang.editor.structure.CellModel_ListWithRole" flags="ng" index="2czfm3">
        <child id="1140524464360" name="cellLayout" index="2czzBx" />
      </concept>
      <concept id="1106270549637" name="jetbrains.mps.lang.editor.structure.CellLayout_Horizontal" flags="nn" index="2iRfu4" />
      <concept id="1106270571710" name="jetbrains.mps.lang.editor.structure.CellLayout_Vertical" flags="nn" index="2iRkQZ" />
      <concept id="1080736578640" name="jetbrains.mps.lang.editor.structure.BaseEditorComponent" flags="ig" index="2wURMF">
        <child id="1080736633877" name="cellModel" index="2wV5jI" />
      </concept>
      <concept id="1239814640496" name="jetbrains.mps.lang.editor.structure.CellLayout_VerticalGrid" flags="nn" index="2EHx9g" />
      <concept id="1078939183254" name="jetbrains.mps.lang.editor.structure.CellModel_Component" flags="sg" stub="3162947552742194261" index="PMmxH">
        <reference id="1078939183255" name="editorComponent" index="PMmxG" />
      </concept>
      <concept id="1186414928363" name="jetbrains.mps.lang.editor.structure.SelectableStyleSheetItem" flags="ln" index="VPM3Z" />
      <concept id="1088013125922" name="jetbrains.mps.lang.editor.structure.CellModel_RefCell" flags="sg" stub="730538219795941030" index="1iCGBv">
        <child id="1088186146602" name="editorComponent" index="1sWHZn" />
      </concept>
      <concept id="1088185857835" name="jetbrains.mps.lang.editor.structure.InlineEditorComponent" flags="ig" index="1sVBvm" />
      <concept id="1139848536355" name="jetbrains.mps.lang.editor.structure.CellModel_WithRole" flags="ng" index="1$h60E">
        <reference id="1140103550593" name="relationDeclaration" index="1NtTu8" />
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
      <concept id="1073390211982" name="jetbrains.mps.lang.editor.structure.CellModel_RefNodeList" flags="sg" stub="2794558372793454595" index="3F2HdR" />
      <concept id="625126330682908270" name="jetbrains.mps.lang.editor.structure.CellModel_ReferencePresentation" flags="sg" stub="730538219795961225" index="3SHvHV" />
      <concept id="1198256887712" name="jetbrains.mps.lang.editor.structure.CellModel_Indent" flags="ng" index="3XFhqQ" />
      <concept id="1166049232041" name="jetbrains.mps.lang.editor.structure.AbstractComponent" flags="ng" index="1XWOmA">
        <reference id="1166049300910" name="conceptDeclaration" index="1XX52x" />
      </concept>
    </language>
  </registry>
  <node concept="24kQdi" id="RDOtZ1g64Z">
    <ref role="1XX52x" to="gous:RDOtZ1fMM$" resolve="PowerModule" />
    <node concept="3EZMnI" id="RDOtZ1g651" role="2wV5jI">
      <node concept="3EZMnI" id="RDOtZ1g658" role="3EZMnx">
        <node concept="VPM3Z" id="RDOtZ1g65a" role="3F10Kt" />
        <node concept="PMmxH" id="RDOtZ1g65i" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        </node>
        <node concept="3F0A7n" id="RDOtZ1g65r" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="2iRfu4" id="RDOtZ1g65d" role="2iSdaV" />
      </node>
      <node concept="3F0ifn" id="RDOtZ1g65E" role="3EZMnx" />
      <node concept="3F2HdR" id="RDOtZ1g65T" role="3EZMnx">
        <ref role="1NtTu8" to="gous:RDOtZ1g64v" resolve="contents" />
        <node concept="2iRkQZ" id="RDOtZ1g65V" role="2czzBx" />
      </node>
      <node concept="2iRkQZ" id="RDOtZ1g654" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="RDOtZ1g673">
    <ref role="1XX52x" to="gous:RDOtZ1g664" resolve="PowerSource" />
    <node concept="3EZMnI" id="RDOtZ1g675" role="2wV5jI">
      <node concept="3EZMnI" id="RDOtZ1g67c" role="3EZMnx">
        <node concept="VPM3Z" id="RDOtZ1g67e" role="3F10Kt" />
        <node concept="PMmxH" id="RDOtZ1g67m" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        </node>
        <node concept="3F0A7n" id="RDOtZ1g67v" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="2iRfu4" id="RDOtZ1g67h" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="RDOtZ1goTf" role="3EZMnx">
        <node concept="3XFhqQ" id="RDOtZ1goUq" role="3EZMnx" />
        <node concept="2iRfu4" id="RDOtZ1goTg" role="2iSdaV" />
        <node concept="3EZMnI" id="RDOtZ1g67M" role="3EZMnx">
          <node concept="VPM3Z" id="RDOtZ1g67O" role="3F10Kt" />
          <node concept="3EZMnI" id="RDOtZ1g682" role="3EZMnx">
            <node concept="VPM3Z" id="RDOtZ1g684" role="3F10Kt" />
            <node concept="3F0ifn" id="RDOtZ1g68c" role="3EZMnx">
              <property role="3F0ifm" value="kind" />
            </node>
            <node concept="3XFhqQ" id="RDOtZ1g68u" role="3EZMnx" />
            <node concept="3F0A7n" id="RDOtZ1g68m" role="3EZMnx">
              <ref role="1NtTu8" to="gous:RDOtZ1g667" resolve="kind" />
            </node>
            <node concept="2iRfu4" id="RDOtZ1g687" role="2iSdaV" />
          </node>
          <node concept="3EZMnI" id="RDOtZ1g68A" role="3EZMnx">
            <node concept="VPM3Z" id="RDOtZ1g68B" role="3F10Kt" />
            <node concept="3F0ifn" id="RDOtZ1g68C" role="3EZMnx">
              <property role="3F0ifm" value="peak" />
            </node>
            <node concept="3XFhqQ" id="RDOtZ1g68D" role="3EZMnx" />
            <node concept="3F0A7n" id="RDOtZ1g68E" role="3EZMnx">
              <ref role="1NtTu8" to="gous:RDOtZ1g66l" resolve="peak" />
            </node>
            <node concept="2iRfu4" id="RDOtZ1g68F" role="2iSdaV" />
          </node>
          <node concept="3EZMnI" id="RDOtZ1g68S" role="3EZMnx">
            <node concept="VPM3Z" id="RDOtZ1g68T" role="3F10Kt" />
            <node concept="3F0ifn" id="RDOtZ1g68U" role="3EZMnx">
              <property role="3F0ifm" value="continuous" />
            </node>
            <node concept="3XFhqQ" id="RDOtZ1g68V" role="3EZMnx" />
            <node concept="3F0A7n" id="RDOtZ1g68W" role="3EZMnx">
              <ref role="1NtTu8" to="gous:RDOtZ1g66o" resolve="continuous" />
            </node>
            <node concept="2iRfu4" id="RDOtZ1g68X" role="2iSdaV" />
          </node>
          <node concept="2EHx9g" id="RDOtZ1g68z" role="2iSdaV" />
        </node>
      </node>
      <node concept="3F0ifn" id="RDOtZ1gAnR" role="3EZMnx" />
      <node concept="2iRkQZ" id="RDOtZ1g678" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="RDOtZ1g69E">
    <ref role="1XX52x" to="gous:RDOtZ1g66z" resolve="PowerConsumer" />
    <node concept="3EZMnI" id="RDOtZ1g69G" role="2wV5jI">
      <node concept="3EZMnI" id="RDOtZ1g69H" role="3EZMnx">
        <node concept="VPM3Z" id="RDOtZ1g69I" role="3F10Kt" />
        <node concept="PMmxH" id="RDOtZ1g69J" role="3EZMnx">
          <ref role="PMmxG" to="tpco:2wZex4PafBj" resolve="alias" />
        </node>
        <node concept="3F0A7n" id="RDOtZ1g69K" role="3EZMnx">
          <ref role="1NtTu8" to="tpck:h0TrG11" resolve="name" />
        </node>
        <node concept="2iRfu4" id="RDOtZ1g69L" role="2iSdaV" />
      </node>
      <node concept="3EZMnI" id="RDOtZ1goVz" role="3EZMnx">
        <node concept="2iRfu4" id="RDOtZ1goV$" role="2iSdaV" />
        <node concept="3XFhqQ" id="RDOtZ1goWz" role="3EZMnx" />
        <node concept="3EZMnI" id="RDOtZ1gZvz" role="3EZMnx">
          <node concept="2iRkQZ" id="RDOtZ1gZv$" role="2iSdaV" />
          <node concept="3EZMnI" id="RDOtZ1g69N" role="3EZMnx">
            <node concept="VPM3Z" id="RDOtZ1g69O" role="3F10Kt" />
            <node concept="3EZMnI" id="RDOtZ1g69V" role="3EZMnx">
              <node concept="VPM3Z" id="RDOtZ1g69W" role="3F10Kt" />
              <node concept="3F0ifn" id="RDOtZ1g69X" role="3EZMnx">
                <property role="3F0ifm" value="peak" />
              </node>
              <node concept="3XFhqQ" id="RDOtZ1g69Y" role="3EZMnx" />
              <node concept="3F0A7n" id="RDOtZ1g69Z" role="3EZMnx">
                <ref role="1NtTu8" to="gous:RDOtZ1g66l" resolve="peak" />
              </node>
              <node concept="2iRfu4" id="RDOtZ1g6a0" role="2iSdaV" />
            </node>
            <node concept="3EZMnI" id="RDOtZ1g6a1" role="3EZMnx">
              <node concept="VPM3Z" id="RDOtZ1g6a2" role="3F10Kt" />
              <node concept="3F0ifn" id="RDOtZ1g6a3" role="3EZMnx">
                <property role="3F0ifm" value="continuous" />
              </node>
              <node concept="3XFhqQ" id="RDOtZ1g6a4" role="3EZMnx" />
              <node concept="3F0A7n" id="RDOtZ1g6a5" role="3EZMnx">
                <ref role="1NtTu8" to="gous:RDOtZ1g66o" resolve="continuous" />
              </node>
              <node concept="2iRfu4" id="RDOtZ1g6a6" role="2iSdaV" />
            </node>
            <node concept="2EHx9g" id="RDOtZ1g6a7" role="2iSdaV" />
          </node>
          <node concept="3F0ifn" id="RDOtZ1gvQl" role="3EZMnx" />
          <node concept="3EZMnI" id="RDOtZ1gZwn" role="3EZMnx">
            <node concept="VPM3Z" id="RDOtZ1gZwp" role="3F10Kt" />
            <node concept="2iRkQZ" id="RDOtZ1gZws" role="2iSdaV" />
            <node concept="3F0ifn" id="RDOtZ1gvQz" role="3EZMnx">
              <property role="3F0ifm" value="provided from" />
            </node>
            <node concept="3EZMnI" id="RDOtZ1gMUo" role="3EZMnx">
              <node concept="2iRfu4" id="RDOtZ1gMUp" role="2iSdaV" />
              <node concept="3XFhqQ" id="RDOtZ1gMUM" role="3EZMnx" />
              <node concept="3F2HdR" id="RDOtZ1gvR2" role="3EZMnx">
                <ref role="1NtTu8" to="gous:RDOtZ1gvQf" resolve="providedFrom" />
                <node concept="2iRkQZ" id="RDOtZ1gMUR" role="2czzBx" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="3F0ifn" id="RDOtZ1gAnq" role="3EZMnx" />
      <node concept="2iRkQZ" id="RDOtZ1g6a8" role="2iSdaV" />
    </node>
  </node>
  <node concept="24kQdi" id="RDOtZ1g6bk">
    <ref role="1XX52x" to="gous:RDOtZ1g6aM" resolve="ProvidedFrom" />
    <node concept="1iCGBv" id="RDOtZ1g6bw" role="2wV5jI">
      <ref role="1NtTu8" to="gous:RDOtZ1g6aP" resolve="source" />
      <node concept="1sVBvm" id="RDOtZ1g6by" role="1sWHZn">
        <node concept="3SHvHV" id="RDOtZ1g6bD" role="2wV5jI" />
      </node>
    </node>
  </node>
</model>

