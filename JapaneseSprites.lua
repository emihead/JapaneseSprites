--- STEAMODDED HEADER
--- MOD_NAME: 日本語スプライト
--- MOD_ID: JapaneseSprites
--- MOD_AUTHOR: [Emihead]
--- MOD_DESCRIPTION: 日本語スプライト

----------------------------------------------
------------MOD CODE -------------------------

local config = { --  コンフィグ 
    joker = true; -- ジョーカースプライト
    consumable = true; -- 天体とスペクトルのスプライト
    blindchips = true; -- ブラインドスプライト
    boosters = true; -- パックスプライト
    vouchers = true; -- バウチャースプライト
    title = true; -- サブタイトル
    text = true -- テキスト変更
}

function SMODS.INIT.JapaneseSprites()

    local mod = SMODS.findModByID("JapaneseSprites")
    local lang_path = mod.path.."ja.lua"

    local function apply_sprites()
        local tpt_mod = SMODS.findModByID("JapaneseSprites")
        if config.vouchers then
            local sprite_vouchers = SMODS.Sprite:new("Voucher", tpt_mod.path, "Vouchers.png", 71, 95, "asset_atli")
            sprite_vouchers:register()
        end
        if config.title then
            local sprite_logo = SMODS.Sprite:new("balatro", tpt_mod.path, "balatro.png", 333, 216, "asset_atli")
            sprite_logo:register()
        end
        if config.consumable then
            local sprite_tarots = SMODS.Sprite:new("Tarot", tpt_mod.path, "Tarots.png", 71, 95, "asset_atli")
            sprite_tarots:register()
        end
        if config.joker then
            local sprite_jkr = SMODS.Sprite:new("Joker", tpt_mod.path, "Jokers.png", 71, 95, "asset_atli")
            sprite_jkr:register()
        end
        if config.boosters then
            local sprite_boost = SMODS.Sprite:new("Booster", tpt_mod.path, "boosters.png", 71, 95, "asset_atli")
            sprite_boost:register()
        end
        if config.blindchips then
            local sprite_blind = SMODS.Sprite:new("blind_chips", tpt_mod.path, "BlindChips.png", 34, 34, "animation_atli", 21)
            sprite_blind:register()
        end
    end

    local function apply_patch()
        if config.text then
            G.localization = assert(loadstring(love.filesystem.read(lang_path)))()
            init_localization()
        end
        apply_sprites()
	end

    if love.filesystem.exists(lang_path) and G.LANG.key == "ja" then
        apply_patch()
    end

    G.set_language_ref = G.set_language
    function G:set_language()
        self:set_language_ref()

        if self.LANG.key == "ja" then
            apply_patch()
        end
    end
end

----------------------------------------------
------------MOD CODE END----------------------