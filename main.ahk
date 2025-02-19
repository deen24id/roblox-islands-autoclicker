#SingleInstance

global on := false

MyGui := Gui("+AlwaysOnTop", "Test")

RadioGroups := {}
MyGui.AddGroupBox("xm  w120 h120 Section", "Action:")
RadioFlowerWater := MyGui.AddRadio("vFlowerWater xs+10 yp+20 w100 Checked Group", "Water Flower")
RadioFlowerHarvest := MyGui.AddRadio("vFlowerHarvest xs+10 yp+20 wp ", "Harvest Flower")
RadioSpiritCrystal := MyGui.AddRadio("vSpiritCrystal xs+10 yp+20 wp", "Spirit Crystal")
RadioBasicAuto := MyGui.AddRadio("vBasicAuto xs+10 yp+20 wp", "Basic Auto")
RadioRepeatJump := MyGui.AddRadio("vRadioRepeatJump xs+10 yp+20 wp", "Repeat Jump")

MyGui.AddButton("vStart xm  w120", " START").OnEvent("Click", ClickButtonStart)
MyGui.AddButton("vStop xm w120 Disabled", "STOP").OnEvent("Click", ClickButtonStop)
StatusBar := MyGui.AddStatusBar(, "Status: OFF")

MyGui.Show("x0 y0")

ClickButtonStart(*) {
	global on := true

	StatusBar.SetText("Status: ON")
	MyGui["Start"].Enabled := false
	MyGui["Stop"].Enabled := true

	while on {
		if (RadioFlowerWater.Value) {
			Click
			Sleep 100
		}
		if (RadioFlowerHarvest.value) {
			Send 'F'
			Sleep 100
		}
		if (RadioSpiritCrystal.value) {
			Click
			Send 'F'
			Sleep 100
		}
		if (RadioBasicAuto.value) {
			Click
			Sleep 100
		}
		if (RadioRepeatJump.Value) {
			Send "{Space}"
			Sleep 100
		}

	}
}

ClickButtonStop(*) {
	global on := false

	StatusBar.SetText("Status: OFF")
	MyGui["Start"].Enabled := true
	MyGui["Stop"].Enabled := false

}

+Enter:: ClickButtonStart
+Esc:: ClickButtonStop