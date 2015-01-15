local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area = createCombatArea(AREA_FULL)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	doCreatureAddHealth(cid, 5000000000)
	doPlayerAddMana(cid, 1000000000)
	return doCombat(cid, combat, var)
end
