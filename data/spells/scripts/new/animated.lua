local combat1 = createCombatObject()
local combat2 = createCombatObject()



local area1 = 	createCombatArea({{1,1,1,1,1},{1,0,2,0,1},{1,1,1,1,1}})

local area2 = 	createCombatArea({{1,1,0,1,1},{0,1,2,1,0}, {1,1,0,1,1}})

				 
				 
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
setAttackFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, 5, 500, 6, 1200)

setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setAttackFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, 5, 500, 6, 1200)

setCombatArea(combat1,area1)
setCombatArea(combat2,area2)


function onCastSpell(cid, var)
	addEvent(doCombat, 1000, cid, combat1, var)
	return doCombat(cid,combat2,var)
end