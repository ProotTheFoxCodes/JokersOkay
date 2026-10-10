SMODS.Atlas{
    key = "retroo",
    path = "retro.png",
    px = 95,
    py = 71
}

SMODS.Joker{
    key = "retro",
    atlas = "jokeay_retroo",
    display_size = { w = 95, h = 71 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    attributes = {"chips","mult","scaling","skip"},
    config = {
        extra = {
            smult = 3,
            schips = 23,
            mult = 0,
            chips = 0,
        }
    },
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return {vars = {"+"..cae.smult, "+"..cae.schips, "+"..cae.mult, "+"..cae.chips}}
    end,
    calculate = function (self, card, context)
        local cae = card.ability.extra

        if context.skip_blind then
            SMODS.scale_card(card,{ref_table = cae, ref_value = "mult", scalar_value = "smult"})
            SMODS.scale_card(card,{ref_table = cae, ref_value = "chips", scalar_value = "schips"})
        end

        if context.joker_main then
            return{
                mult = cae.mult,
                chips = cae.chips
            }
        end
    end
}