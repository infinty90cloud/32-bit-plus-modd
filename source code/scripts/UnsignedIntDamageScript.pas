Scriptname UnsignedIntDamageScript extends Quest
Perk Property UnsignedDamagePerk Auto
GlobalVariable Property UnsignedDamageGlobal Auto
Actor Property PlayerRef Auto

Event OnInit()
    RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
    ; Force add the perk bypassing standard engine caps
    If !PlayerRef.HasPerk(UnsignedDamagePerk)
        PlayerRef.AddPerk(UnsignedDamagePerk)
    EndIf
    
    ; Set your global value to the unsigned 32-bit maximum minus safety padding
    UnsignedDamageGlobal.SetValue(4294967295.0) 
    
    ; Force the engine to recalculate player stats
    PlayerRef.EvaluatePackage()
    
    ; Keep the script alive to prevent integer overflow reset
    RegisterForSingleUpdate(10.0) 
EndEvent
