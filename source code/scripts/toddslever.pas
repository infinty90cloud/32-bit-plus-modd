Scriptname toddslever extends ObjectReference

Spell Property todsspelll Auto  
Spell Property todsspelll3 Auto  
Bool Property IsLooping Auto Hidden

Event OnActivate(ObjectReference akActionRef)
    If (akActionRef == Game.GetPlayer() && !IsLooping)
        IsLooping = True
        Debug.Notification("Todd Howard's intager power takes hold.....")
        
        ; Start the safe engine loop
        RegisterForSingleUpdate(1.0) 
    EndIf
EndEvent

Event OnUpdate()
    ; This code runs safely every X seconds
    If (IsLooping)
         todsspelll.Cast(Self, Game.GetPlayer()) 
  todsspelll3.Cast(Self, Game.GetPlayer()) 
        
        ; Loop the update by registering itself again (every 1.0 seconds)
        RegisterForSingleUpdate(1.0) 
    EndIf
EndEvent
