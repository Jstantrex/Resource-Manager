--
-- Please see the license.txt file included with this distribution for
-- attribution and copyright information.
--

local resetHealthOriginal;

function onInit()
	if Session.IsHost then
		restOriginal = CombatManager2.rest;
		CombatManager2.rest = rest;

		CombatManager.setCustomDeleteCombatantHandler(onCombatantDeleted);
	end
end

function onClose()
	CombatManager.removeCustomDeleteCombatantHandler(onCombatantDeleted);
end

function rest(bShort)
	restOriginal(bShort);
	ResourceManager.rest(bShort);
end

function onCombatantDeleted(nodeCombatant)
	ResourceManager.removeResourceHandlers(nodeCombatant.getPath());
end