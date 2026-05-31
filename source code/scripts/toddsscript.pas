Scriptname toddsscript extends ActiveMagicEffect

; Link your newly created Global Variable
GlobalVariable Property UnsignedRegister Auto

Float Function GetUnsignedValue(Int signedInt) Global
    If (signedInt < 0) 
        Return (signedInt As Float) + 4294967296.0
    EndIf 
    Return signedInt As Float
EndFunction

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Actor player = Game.GetPlayer()
    
    If (akTarget && akTarget != player)
        ; 1. Inject your janky signed underflow integer
        Int signedJankDamage = -500000 
        
        ; 2. Process it through your custom unsigned converter
        Float finalUnsignedValue = GetUnsignedValue(signedJankDamage)
        
        ; 3. Store the clean 4-billion range number in your global register
        UnsignedRegister.SetValue(finalUnsignedValue)
        
        ; 4. Vaporize the target safely by calling their current health math directly
        Float currentHealth = akTarget.GetActorValue("Health")
        akTarget.DamageActorValue("Health", currentHealth) 
        
        Debug.Notification("Stored Unsigned Value: " + finalUnsignedValue)
    EndIf
EndEvent
