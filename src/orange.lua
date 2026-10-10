SMODS.Atlas{
    key = "orang",
    path = "orange.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "orange",
    atlas = "jokeay_orang",
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    config = {
        extra = {
            hchips = -7,
            dchips = 13,
            chips = 0
        }
    },
    attributes = {"chips","scaling","discard"},
    loc_vars = function(self,info_queue,card)
        local cae = card.ability.extra
        return {vars = {cae.hchips, "+"..cae.dchips, "+"..cae.chips}}
    end,
    calculate = function (self, card, context)
        local cae = card.ability.extra

        if context.press_play then
            SMODS.scale_card(card, {ref_table = cae, ref_value = "chips", scalar_value = "hchips"})
            if cae.chips < 1 then cae.chips = 0 end
        end

        if context.pre_discard then
            SMODS.scale_card(card, {ref_table = cae, ref_value = "chips", scalar_value = "dchips"})
            if cae.chips < 1 then cae.chips = 0 end
        end

        if context.joker_main then
            return{chips = cae.chips}
        end
    end
}