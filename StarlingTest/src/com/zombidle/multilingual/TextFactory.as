package com.zombidle.multilingual {
	import com.lachhh.utils.Utils;
	/**
	 * @author LachhhSSD
	 */
	public class TextFactory {
		static public var LANGUAGE_EN : TextLanguage = new TextLanguage();
		static public var instance:TextFactory = new TextFactory();
		static public var ID_NULL:int = setEnText("");
		
		static public var ID_NPC_DUMMY_NAME:int = setEnText("--NPCNAME--");
		static public var ID_STORY_LEVEL_28_HOUSE_WIZARD:int = setEnText("This spell might help you in your journey.");
		static public var ID_STORY_NPC_ON_FIRE_1:int = setEnText("What have you done!!!");
		static public var ID_STORY_NPC_ON_FIRE_2:int = setEnText("Ohhhh the pain!");
		static public var ID_STORY_NPC_ON_FIRE_3:int = setEnText("You were supposed to save us! This is the exact opposite!");
		
		static public var ID_HIT_BOSS0_DEAD_BODY:int = setEnText("I think it's dead enough.");
		
		static public var ID_STORY_NPC_BOAT_TALK:int = setEnText("Phew!  That was a long ride!");
		static public var ID_STORY_NPC_BOAT_1:int = setEnText("Hey! You'll drown if you fall in water!");
		static public var ID_STORY_NPC_BOAT_2:int = setEnText("Did you listen to me?  I said you will DIE if you go in there!");
		static public var ID_STORY_NPC_BOAT_3:int = setEnText("Tell me how you expect to swim with a 40 pounds armor?");
		static public var ID_STORY_NPC_BOAT_4:int = setEnText("We came from that way!  Why don't you go left and keep the story going?");
		static public var ID_STORY_NPC_BOAT_5:int = setEnText("Why the hell do you want to go there anyway?!?");
		static public var ID_STORY_NPC_BOAT_6:int = setEnText("You're just going to ignore me right?");
		static public var ID_STORY_NPC_BOAT_7:int = setEnText("You are just like all those other armor wearing adventurers, treating NPC like soulless people...");
		static public var ID_STORY_NPC_BOAT_8:int = setEnText("I will report your behavior to the organization of proud NPC.");
		static public var ID_STORY_NPC_BOAT_9:int = setEnText("Hey listen!                                        ...Hahaha, joking, I always wanted to be fairy.");
		static public var ID_STORY_NPC_BOAT_10:int = setEnText("Aren't you tired of this joke yet?");
		static public var ID_STORY_NPC_BOAT_11:int = setEnText("You know what?  Alright!  Go die in there, I don't care anymore!  Have fun drowning.");
		
		static public var ID_STORY_NPC_EARLY_ACCESS:int = setEnText("Hey man! Just want to say that the world map will be bigger, with more castles, more weapons, more stuff!");

		static public var ID_LEVEL_UP:int = setEnText("Level Up");
		static public var ID_LEVEL_UP_DESC:int = setEnText("Select upgrade");
		
		static public var ID_GAMEOVER:int = setEnText("Game Over");
		static public var ID_SELECT_YOUR_PUNISHMENT:int = setEnText("Select your punishment");
		static public var ID_SOUND:int = setEnText("Sound");
		static public var ID_MUSIC:int = setEnText("Music");
		static public var ID_LIFE:int = setEnText("LIFE");
		static public var ID_MAGIC:int = setEnText("MAGIC");
		static public var ID_POWER:int = setEnText("POWER");
		static public var ID_YES:int = setEnText("YES");
		static public var ID_NO:int = setEnText("NO");
		static public var ID_OK:int = setEnText("OK");
		static public var ID_SHOP:int = setEnText("SHOP");
		static public var ID_EXIT_SHOP:int = setEnText("EXIT SHOP");
		static public var ID_BACK_TO_TITLE_QUESTION:int = setEnText("You will lose any unsaved progress,  are you sure?");
		
		static public var ID_TUTO_UI:int = setEnText("[x]:ConFirm [z]:Back");
		static public var ID_TUTO_UI_STORY:int = setEnText("[x]:Next [z]:Skip");
		
		static public var ID_SOLD:int = setEnText("SOLD");
		static public var ID_INVENTORY_FULL:int = setEnText("Inventory full");
		static public var ID_FULL:int = setEnText("full");
		static public var ID_X_GOLD:int = setEnText("[x] gold");
		static public var ID_BACK_TO_TITLE:int = setEnText("Back To Title");
		static public var ID_BACK:int = setEnText("Back");
		static public var ID_RESUME:int = setEnText("Resume");
		static public var ID_PAUSE:int = setEnText("Pause");
		static public var ID_NEW_GAME:int = setEnText("New Game");
		static public var ID_LOAD_GAME:int = setEnText("Load Game");
		static public var ID_DELETE_GAME:int = setEnText("Delete Game");
		static public var ID_DELETE_QUESTION:int = setEnText("Are you sure you want to delete this game?");
		static public var ID_NEW_GAME_PENIS_1:int = setEnText("You really want to name your character [x]!?!");
		static public var ID_NEW_GAME_PENIS_2:int = setEnText("He's a badass knight fighting demonic monsters from hell...");
		static public var ID_NEW_GAME_PENIS_3:int = setEnText("...and your plan is to call him '[x]'.");
		static public var ID_NEW_GAME_PENIS_4:int = setEnText("...alright,  I ain't your mom.");
		static public var ID_NEW_GAME_PENIS_5:int = setEnText("...It's actually pretty funny.");
		static public var ID_NEW_GAME_PENIS_6:int = setEnText("'[x]' lol");
		
		static public var ID_RESTART_NORMAL:int = setEnText("Casual Restart");
		static public var ID_SAVE_AND_CONTINUE:int = setEnText("Save and Continue");
		static public var ID_RESTART_BADASS:int = setEnText("Hardcore Restart");
		static public var ID_RESTART_NORMAL_DESC:int = setEnText("You keep your progress, but you might regret it later...");
		static public var ID_RESTART_BADASS_DESC:int = setEnText("Like the good NES days, you go back to your last save point and lose all your progress.");
		static public var ID_RESTART_SAVECONTINUE_DESC:int = setEnText("You're still in casual mode, so you keep your progress.");
		static public var ID_RESTART_NORMAL_AREYOUSURE:int = setEnText("You won't be able to select the Hardcode restart anymore. Are you sure?");
		
		static public var ID_MAP:int = setEnText("Map");
		static public var ID_SKILLS:int = setEnText("Skills");
		static public var ID_STATS:int = setEnText("Stats");
		static public var ID_INVENTORY:int = setEnText("Inventory");
		static public var ID_NEXT:int = setEnText("NEXT");
		static public var ID_POTIONS:int = setEnText("Potions");
		
		static public var ID_START_GAME:int = setEnText("Start Game");
		static public var ID_ACHIEVEMENTS:int = setEnText("Achievements");
		static public var ID_GAME_WIZARD:int = setEnText("Game Wizard");
		static public var ID_EXIT_GAME:int = setEnText("Exit Game");
		static public var ID_ENTER_CODE:int = setEnText("Enter Code");
		static public var ID_GAME_SELECTION:int = setEnText("Game Selection");
		static public var ID_OPTIONS:int = setEnText("Options");
		static public var ID_DAY_1_DLC:int = setEnText("Day 1 DLC");
		static public var ID_DONE:int = setEnText("Done");
		static public var ID_CANCEL:int = setEnText("Cancel");
		static public var ID_TOO_MANY_SAVE_FILES:int = setEnText("There are too many save files.");
		static public var ID_REGISTER_YOUR_NAME:int = setEnText("Register your name");
		
		static public var ID_CONTROLS:int = setEnText("Controls");
		static public var ID_AUDIO:int = setEnText("Audio");
		static public var ID_VIDEO:int = setEnText("Video");
		static public var ID_CREDITS:int = setEnText("Credits");
		
		static public var ID_EQUIPMENT:int = setEnText("EQUIPMENT");
		static public var ID_WEAPONS:int = setEnText("Maces");
		static public var ID_WEAPON_1:int = setEnText("Mace");
		static public var ID_WEAPON_2:int = setEnText("Silver Mace");
		static public var ID_WEAPON_3:int = setEnText("Magic Mace");
		static public var ID_WEAPON_4:int = setEnText("Holy Mace");
		
		static public var ID_ARMORS:int = setEnText("Armors");
		static public var ID_ARMOR_1:int = setEnText("Cloth");
		static public var ID_ARMOR_2:int = setEnText("Chain Mail");
		static public var ID_ARMOR_3:int = setEnText("Silver Armor");
		static public var ID_ARMOR_4:int = setEnText("Holy Armor");
		
		static public var ID_ARMOR_1_DESC:int = setEnText("--ClothDESC-");
		static public var ID_ARMOR_2_DESC:int = setEnText("Damage are reduced by 25%");
		static public var ID_ARMOR_3_DESC:int = setEnText("--Silver Armor DSEC-");
		static public var ID_ARMOR_4_DESC:int = setEnText("--Holy Armor DESC--");
		
		static public var ID_POTION_1:int = setEnText("Life Potion");
		static public var ID_POTION_2:int = setEnText("Mana Potion");
		static public var ID_POTION_3:int = setEnText("Elixir");
		
		static public var ID_SKILL_1:int = setEnText("--SKILL1BREAKBLOCK--");
		static public var ID_SKILL_2:int = setEnText("--SKILL2DOWNATTACK--");
		static public var ID_SKILL_3:int = setEnText("--SKILL3UPATTACK--");
		static public var ID_SKILL_4:int = setEnText("--SKILL4CHARGEATTACK--");
		
		static public var ID_SPELLS:int = setEnText("Spells");
		
		static public var ID_SPELL_1_HEAL:int = setEnText("Heal");
		static public var ID_SPELL_2_THUNDER:int = setEnText("Thunder");
		static public var ID_SPELL_3_HOLY_LIGHT:int = setEnText("Holy Light");
		static public var ID_SPELL_4_TELEPORT:int = setEnText("Teleport");
		static public var ID_SPELL_5_TIME_WARP:int = setEnText("Time Warp");
		static public var ID_SPELL_6_FAMILIAR:int = setEnText("Familiar");
		static public var ID_SPELL_7_SHIELD:int = setEnText("Shield");
				
		static public var ID_POTION_1_DESC:int = setEnText("Replenish your health");
		static public var ID_POTION_2_DESC:int = setEnText("Replenish your Mana");
		static public var ID_POTION_3_DESC:int = setEnText("Replenish both your health and mana");
		
		static public var ID_SKILL_1_DESC:int = setEnText("--SKILL1BREAKBLOCKDESC--");
		static public var ID_SKILL_2_DESC:int = setEnText("--SKILL2DOWNATTACKDESC--");
		static public var ID_SKILL_3_DESC:int = setEnText("--SKILL3UPATTACKDESC--");
		static public var ID_SKILL_4_DESC:int = setEnText("--SKILL4CHARGEATTACKDESC--");
		
		static public var ID_SPELL_1_HEAL_DESC:int = setEnText("Heal your wounds");
		static public var ID_SPELL_2_THUNDER_DESC:int = setEnText("Create a powerful thunderstorm");
		static public var ID_SPELL_3_HOLY_LIGHT_DESC:int = setEnText("Enchant your weapon with holy power");
		static public var ID_SPELL_4_TELEPORT_DESC:int = setEnText("Warp to checkpoint");
		static public var ID_SPELL_5_TIME_WARP_DESC:int = setEnText("Switch from day to night");
		static public var ID_SPELL_6_FAMILIAR_DESC:int = setEnText("Summons a familiar to help you in battle");
		static public var ID_SPELL_7_SHIELD_DESC:int = setEnText("Your armor is stronger");
					
					
		static public var ID_CANT_USE_TIME_WARP_IN_CASTLE:int = GetNextTextId();
		static public var ID_ACTIVATED:int = GetNextTextId();
		static public var ID_DEACTIVATED:int = GetNextTextId();
		
		static public var ID_CODE_EFFECT_0:int = GetNextTextId();
		static public var ID_CODE_EFFECT_1:int = GetNextTextId();
		static public var ID_CODE_EFFECT_2:int = GetNextTextId();
		static public var ID_CODE_OTT_GORE:int = GetNextTextId();
		static public var ID_CODE_CREEPY:int = GetNextTextId();
		static public var ID_CODE_CORPORATE_MODE:int = GetNextTextId();
		static public var ID_CORPORATE_RATING_SYSTEM:int = GetNextTextId();
		static public var ID_CORPORATE_RATING_SYSTEM_YES:int = GetNextTextId();
		static public var ID_CORPORATE_RATING_SYSTEM_NO:int = GetNextTextId();
		
		static public var ID_CORPORATE_ENERGY_SYSTEM:int = GetNextTextId();
		
		static public var ID_MAXED:int = GetNextTextId();
		
		static public var ID_SAVE_SHRINE:int = GetNextTextId();
		static public var ID_SAVE_COMPLETE:int = GetNextTextId();
		
		static public var ID_ORB_1:int = GetNextTextId();
		static public var ID_ORB_2:int = GetNextTextId();
		static public var ID_ORB_3:int = GetNextTextId();
		
		
		static public var ID_THANKS:int = GetNextTextId();
		static public var ID_YOU_ALREADY_HAVE_THAT:int = GetNextTextId();
		
		
		static public var ID_STORY_DUMMY_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_13:int = GetNextTextId();
		
		static public var ID_STORY_SHOP_EMPTY_1:int = GetNextTextId();
		static public var ID_STORY_SHOP_EMPTY_2:int = GetNextTextId();
		static public var ID_STORY_SHOP_EMPTY_3:int = GetNextTextId();
		
		static public var ID_STORY_SHOP_CANCEL_1:int = GetNextTextId();
		static public var ID_STORY_SHOP_CANCEL_2:int = GetNextTextId();
		static public var ID_STORY_SHOP_CANCEL_3:int = GetNextTextId();
		
		static public var ID_STORY_SHOP_NO_MONEY_1:int = GetNextTextId();
		static public var ID_STORY_SHOP_NO_MONEY_2:int = GetNextTextId();
		static public var ID_STORY_SHOP_NO_MONEY_3:int = GetNextTextId();
		
		static public var ID_STORY_TUTORIAL_0:int = GetNextTextId();
		static public var ID_STORY_TUTORIAL_1:int = GetNextTextId();
		
		static public var ID_STORY_LEVEL_6_HOUSE_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_1_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_2_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_3:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_4:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_5:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_5_CURED:int = GetNextTextId();
		static public var ID_STORY_LEVEL_6_HOUSE_5_CURED_WEAPON_GIVEN:int = GetNextTextId();
		static public var ID_STORY_LEVEL_8_HOUSE_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_1_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_3:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_4:int = GetNextTextId();
		static public var ID_STORY_LEVEL_18_HOUSE_5:int = GetNextTextId();
		static public var ID_STORY_LEVEL_24_HOUSE_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_24_HOUSE_2:int = GetNextTextId();
		static public var ID_STORY_LEVEL_24_HOUSE_3:int = GetNextTextId();
		static public var ID_STORY_LEVEL_24_HOUSE_4:int = GetNextTextId();
		static public var ID_STORY_LEVEL_24_HOUSE_5:int = GetNextTextId();
		
		
		static public var ID_STORY_LEVEL_3N_WIZARD_1:int = GetNextTextId();
		static public var ID_STORY_LEVEL_3N_WIZARD_2:int = GetNextTextId();
		
		static public var ID_STORY_LEVEL15_WEREWOLF:int = GetNextTextId();
		
		
		
		static public var ID_STORY_VILLAGE1_1:int = GetNextTextId();
		static public var ID_STORY_VILLAGE1_2:int = GetNextTextId();
		static public var ID_STORY_VILLAGE1_3:int = GetNextTextId();
		
		static public var ID_STORY_VILLAGE1_NIGHT_1:int = GetNextTextId();
		static public var ID_STORY_VILLAGE1_NIGHT_2:int = GetNextTextId();
		static public var ID_STORY_VILLAGE1_NIGHT_3:int = GetNextTextId();
		
		static public var ID_STORY_VILLAGE1_NIGHT_INTRO:int = GetNextTextId();
		
		static public var ID_STORY_DAY_TO_NIGHT:int = GetNextTextId();
		static public var ID_STORY_NIGHT_TO_DAY:int = GetNextTextId();
		
		
		static public var ID_ROLL_OVER_ACH:int = GetNextTextId();
		static public var ID_MP:int = GetNextTextId();
		static public var ID_EXP:int = GetNextTextId();
		
		
		static public var ID_MSG:int = GetNextTextId();
		static public var ID_NOT_ENOUGH_MONEY:int = GetNextTextId();
		static public var ID_CASH:int = GetNextTextId();
		
		static public var ID_LVL:int = GetNextTextId();
		
		static public var ID_TROPHY_TITLE_1:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_2:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_3:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_4:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_5:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_6:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_7:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_8:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_9:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_10:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_11:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_12:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_13:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_14:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_15:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_16:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_17:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_18:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_19:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_20:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_21:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_22:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_23:int = GetNextTextId();
		static public var ID_TROPHY_TITLE_24:int = GetNextTextId();
		
		static public var ID_TROPHY_DESC_1:int = GetNextTextId();
		static public var ID_TROPHY_DESC_2:int = GetNextTextId();
		static public var ID_TROPHY_DESC_3:int = GetNextTextId();
		static public var ID_TROPHY_DESC_4:int = GetNextTextId();
		static public var ID_TROPHY_DESC_5:int = GetNextTextId();
		static public var ID_TROPHY_DESC_6:int = GetNextTextId();
		static public var ID_TROPHY_DESC_7:int = GetNextTextId();
		static public var ID_TROPHY_DESC_8:int = GetNextTextId();
		static public var ID_TROPHY_DESC_9:int = GetNextTextId();
		static public var ID_TROPHY_DESC_10:int = GetNextTextId();
		static public var ID_TROPHY_DESC_11:int = GetNextTextId();
		static public var ID_TROPHY_DESC_12:int = GetNextTextId();
		static public var ID_TROPHY_DESC_13:int = GetNextTextId();
		static public var ID_TROPHY_DESC_14:int = GetNextTextId();
		static public var ID_TROPHY_DESC_15:int = GetNextTextId();
		static public var ID_TROPHY_DESC_16:int = GetNextTextId();
		static public var ID_TROPHY_DESC_17:int = GetNextTextId();
		static public var ID_TROPHY_DESC_18:int = GetNextTextId();
		static public var ID_TROPHY_DESC_19:int = GetNextTextId();
		static public var ID_TROPHY_DESC_20:int = GetNextTextId();
		static public var ID_TROPHY_DESC_21:int = GetNextTextId();
		static public var ID_TROPHY_DESC_22:int = GetNextTextId();
		static public var ID_TROPHY_DESC_23:int = GetNextTextId();
		static public var ID_TROPHY_DESC_24:int = GetNextTextId();
		static public var ID_TROPHY_DESC_25:int = GetNextTextId();
		static public var ID_TROPHY_DESC_26:int = GetNextTextId();
		static public var ID_TROPHY_DESC_27:int = GetNextTextId();		

		//***Constantes
		static public const ID_AUTO_ALCEDOR_0:int = GetNextTextId();
		static public const ID_AUTO_ENTER_0:int = GetNextTextId();
		static public const ID_AUTO_AUGKIOPP_0:int = GetNextTextId();
		static public const ID_AUTO_ALCEDOR_1:int = GetNextTextId();
		static public const ID_AUTO_UNKLZXXG_0:int = GetNextTextId();
		static public const ID_AUTO_JERUSALEM_0:int = GetNextTextId();
		static public const ID_AUTO_BUT_0:int = GetNextTextId();
		static public const ID_AUTO_A_0:int = GetNextTextId();
		static public const ID_AUTO_THIS_0:int = GetNextTextId();
		static public const ID_AUTO_BUY__0:int = GetNextTextId();
		static public const ID_AUTO_NOT_0:int = GetNextTextId();
		static public const ID_AUTO_INVENTORY_0:int = GetNextTextId();
		static public const ID_AUTO_ALREADY_0:int = GetNextTextId();
		static public const ID_AUTO_X_0:int = GetNextTextId();
		static public const ID_AUTO_OVERWORLD_0:int = GetNextTextId();
		static public const ID_AUTO_CASTLE_0:int = GetNextTextId();
		static public const ID_AUTO_CASTLE_1:int = GetNextTextId();
		static public const ID_AUTO_HELL_0:int = GetNextTextId();
		static public const ID_AUTO_CASTLE_2:int = GetNextTextId();
		static public const ID_AUTO_MAP_0:int = GetNextTextId();
		static public const ID_AUTO_EFFECTS_0:int = GetNextTextId();
		static public const ID_AUTO_CODE_0:int = GetNextTextId();
		static public const ID_AUTO_LEVEL_UP_0:int = GetNextTextId();
		static public const ID_AUTO_MAGIC__0:int = GetNextTextId();
		static public const ID_AUTO_DEFENSE__0:int = GetNextTextId();
		static public const ID_AUTO_COST__0:int = GetNextTextId();
		static public const ID_AUTO_POWER__0:int = GetNextTextId();
		static public const ID_AUTO_NEW_0:int = GetNextTextId();
		static public const ID_AUTO_MONEY__0:int = GetNextTextId();
		static public const ID_AUTO_EXP__0:int = GetNextTextId();
		static public const ID_AUTO_STATUS_0:int = GetNextTextId();
		static public const ID_AUTO_NEXT__0:int = GetNextTextId();
		static public const ID_AUTO_ARMOR_0:int = GetNextTextId();
		static public const ID_AUTO_MACE_0:int = GetNextTextId();
		static public const ID_AUTO_POTION_0:int = GetNextTextId();
		static public const ID_AUTO_EQUIPMENT_0:int = GetNextTextId();
		static public const ID_AUTO_SPELLS_0:int = GetNextTextId();
		static public const ID_AUTO___0:int = GetNextTextId();
		static public const ID_AUTO_SOUND_0:int = GetNextTextId();
		static public const ID_AUTO_MUSIC_0:int = GetNextTextId();
		static public const ID_AUTO_SFX_0:int = GetNextTextId();
		static public const ID_AUTO_LIFE__0:int = GetNextTextId();
		static public const ID_AUTO_MANA__0:int = GetNextTextId();
		static public const ID_AUTO_E_0:int = GetNextTextId();
		static public const ID_AUTO______0:int = GetNextTextId();
		
		static public const ID_AUTO_CANCEL_0:int = GetNextTextId();
		static public const ID_AUTO_ACHIEVEMENT_0:int = GetNextTextId();
		static public const ID_AUTO_CREDITS_0:int = GetNextTextId();
		static public const ID_AUTO_DELETE_0:int = GetNextTextId();
		static public const ID_AUTO_RETURN_0:int = GetNextTextId();
		static public const ID_AUTO_BACK_0:int = GetNextTextId();
		static public const ID_AUTO_ENTER_1:int = GetNextTextId();
		static public const ID_AUTO_BUY_0:int = GetNextTextId();
		static public const ID_AUTO_INVENTORY_1:int = GetNextTextId();
		static public const ID_AUTO_GAME_0:int = GetNextTextId();
		static public const ID_AUTO_NEXT_0:int = GetNextTextId();
		static public const ID_AUTO_YES_0:int = GetNextTextId();
		static public const ID_AUTO_OK_0:int = GetNextTextId();
		static public const ID_AUTO_NO_0:int = GetNextTextId();
		static public const ID_AUTO_LOAD_0:int = GetNextTextId();
		static public const ID_AUTO_GAME_1:int = GetNextTextId();
		static public const ID_AUTO_BLARRRRRRRGGGGG_____0:int = GetNextTextId();
		static public const ID_AUTO_SA_0:int = GetNextTextId();
		static public const ID_AUTO_GAMES_0:int = GetNextTextId();
		static public const ID_AUTO_PROGRAMER_0:int = GetNextTextId();
		static public const ID_AUTO_SIMON_0:int = GetNextTextId();
		static public const ID_AUTO_DIRECTOR_0:int = GetNextTextId();
		static public const ID_AUTO_ETIENNE_0:int = GetNextTextId();
		static public const ID_AUTO_BETA_0:int = GetNextTextId();
		static public const ID_AUTO_ETIENNE_1:int = GetNextTextId();
		static public const ID_AUTO_GAME_2:int = GetNextTextId();
		static public const ID_AUTO_SPONSOR_0:int = GetNextTextId();
		static public const ID_AUTO_ALCEDOR_2:int = GetNextTextId();
		static public const ID_AUTO_POOZNTGZ_0:int = GetNextTextId();
		static public const ID_AUTO_BOSS__0:int = GetNextTextId();
		
		static public const ID_AUTO_MUSIC__0:int = GetNextTextId();
		static public const ID_AUTO_MUSIC_OLI__0:int = GetNextTextId();

		private static var _id : int = 0;
		public function TextFactory() {
			super();
		}
		
		public function init():void {
			
			LANGUAGE_EN.addText(ID_AUTO_MUSIC__0, "Musics");
			LANGUAGE_EN.addText(ID_AUTO_MUSIC_OLI__0, "Olivier Couillard");
			
			
			LANGUAGE_EN.addText(ID_THANKS, "Thanks!");
			LANGUAGE_EN.addText(ID_YOU_ALREADY_HAVE_THAT, "You already have this.");
			
			
			LANGUAGE_EN.addText(ID_STORY_DUMMY_1, "What is this ?!?! \n\n ...Things seem to have changed a lot during my absence.");
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL_3N_WIZARD_1, "This is a shield magic.Take it.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_3N_WIZARD_2, "You want more ? I already gave you a spell!");
			
			
			
			LANGUAGE_EN.addText(ID_STORY_SHOP_EMPTY_1, "Use your equipment wisely.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_EMPTY_2, "I hope it'll help you.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_EMPTY_3, "Have you tried it yet ?");
			
			LANGUAGE_EN.addText(ID_STORY_SHOP_CANCEL_1, "Come back anytime then.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_CANCEL_2, "I hope you'll change your mind.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_CANCEL_3, "Alright, leave me alone then, I have stuff to do.");
			
			LANGUAGE_EN.addText(ID_STORY_SHOP_NO_MONEY_1, "You don't have enough money.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_NO_MONEY_2, "Come back when you'll have the money.");
			LANGUAGE_EN.addText(ID_STORY_SHOP_NO_MONEY_3, "This stuff isn't free! Show me the money first.");
			
			LANGUAGE_EN.addText(ID_STORY_TUTORIAL_0, "Move: Arrows, WASD\n\nAttack: X,J\n\nJump:   Z,K\n\nMagic:  C,L\n\nInventory : SPACE");
			LANGUAGE_EN.addText(ID_STORY_TUTORIAL_1, "Hit the statue to save your progress.");
		
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_1, "Here, take this spell, it'll make you feel better when wounded.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_1_2, "I gave you everything I had my friend.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_2, "My husband has gone Mad! The wretched creature has stolen his soul, please take this key and go check him out.  He's in the house underground. I'm afraid for his life.");
			//LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_2, "Lachhh is the best human being on earth because he made me an NPC in Infernax.  I luv him so much and he's handsome. :)");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_2_2, "Please go check my husband.  He's in the house underground. I'm afraid for his life.");
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_3, "Please take a look and buy anything you want !");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_4, "Please stay for a while.  May this rest purify your body and heal your wound.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_5, "Evil forces has darken my soul, please help me !!!");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_5_CURED, "Oh thank you ! I can now get back to my wife.  Please take this holy armor, it shall protect you against enemies.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_6_HOUSE_5_CURED_WEAPON_GIVEN, "I hope this armor will help you.");
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL_8_HOUSE_1, "Welcome to my shop! I don't get that much customer...");
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_1, "Please take this spell,  may his power helps you during your journey.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_1_2, "May this spell helps you during your journey.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_2, "I saw a castle in the sea during the last night storm");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_3, "Please stay for a while.  May this rest purify your body and heal your wound.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_4, "Please take a look and buy anything you want !");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_18_HOUSE_5, "Why is this curse upon us?");
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL_24_HOUSE_1, "I have crafted a great weapon.  You can buy it if you have the money.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_24_HOUSE_2, "Please save us");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_24_HOUSE_3, "I know nothing");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_24_HOUSE_4, "Please stay for a while.  May this rest purify your body and heal your wound.");
			LANGUAGE_EN.addText(ID_STORY_LEVEL_24_HOUSE_5, "Corcell rules over all vermins");

			LANGUAGE_EN.addText(ID_STORY_LEVEL_13, "i can't believe this happened to my country i must put a end to this!");

		
			
			LANGUAGE_EN.addText(ID_STORY_LEVEL15_WEREWOLF, "I am cursed by the moon.");
			
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_1, "I AM ERROR");
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_2, "Please save us ! ");
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_3, "mahalmon lair is near.");
			
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_NIGHT_1, "This... thing.... it's not human.  \nIt's pure evil.");
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_NIGHT_2, "Please save us !");
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_NIGHT_3, "This creature tried to kill us in our sleep !");
			
			LANGUAGE_EN.addText(ID_STORY_VILLAGE1_NIGHT_INTRO, "Oh God they are burning someone....\n wait that's not a human !?\n\nwhat is that wretched creature? ");
			
			LANGUAGE_EN.addText(ID_STORY_DAY_TO_NIGHT, "A veil of darkness covered our land.  The night has arrived, evil forces awakens...");
			LANGUAGE_EN.addText(ID_STORY_NIGHT_TO_DAY, "Finally,  the dawn arrived upon us, weakening all evil forces...");
			
			LANGUAGE_EN.addText(ID_ROLL_OVER_ACH, "Roll Over an Achievement");
			
			LANGUAGE_EN.addText(ID_MP, "MP");
			LANGUAGE_EN.addText(ID_EXP, "EXP");
			
			LANGUAGE_EN.addText(ID_MSG, "English");
			LANGUAGE_EN.addText(ID_NOT_ENOUGH_MONEY, "You don't have enough money, would you like to buy more?");
			
			LANGUAGE_EN.addText(ID_CASH, "Cash : ");
		
		
			LANGUAGE_EN.addText(ID_CANT_USE_TIME_WARP_IN_CASTLE, "You can't use time warp here.");
			LANGUAGE_EN.addText(ID_ACTIVATED, "Activated");
			LANGUAGE_EN.addText(ID_DEACTIVATED, "Deactivated");
		
			LANGUAGE_EN.addText(ID_CODE_EFFECT_0, "Start with 6 lives");
			LANGUAGE_EN.addText(ID_CODE_EFFECT_1, "Magic use less mana");
			LANGUAGE_EN.addText(ID_CODE_EFFECT_2, "Demon mode");
			LANGUAGE_EN.addText(ID_CODE_OTT_GORE, "Over the top gore mode");
			LANGUAGE_EN.addText(ID_CODE_CREEPY, "Creepy mode");
			LANGUAGE_EN.addText(ID_CODE_CORPORATE_MODE, "Corporate mode");
			LANGUAGE_EN.addText(ID_CORPORATE_RATING_SYSTEM, "Would you rate this game 5 stars?");
			LANGUAGE_EN.addText(ID_CORPORATE_RATING_SYSTEM_YES, "Great! Connect to PEW-PLAY to put your rating!");
			LANGUAGE_EN.addText(ID_CORPORATE_RATING_SYSTEM_NO, "Oh ok,  we won't let you rate at all then.");
			
			LANGUAGE_EN.addText(ID_CORPORATE_ENERGY_SYSTEM, "You don't have enough energy, would you like to buy more?");
			
			
			
			LANGUAGE_EN.addText(ID_MAXED, "MAXED");
			LANGUAGE_EN.addText(ID_SAVE_SHRINE, "Save your progress?");
			LANGUAGE_EN.addText(ID_SAVE_COMPLETE, "Your progress has been saved.");
			
			LANGUAGE_EN.addText(ID_ORB_1, "You learned the spell Thunder!");
			LANGUAGE_EN.addText(ID_ORB_2, "You learned the spell Double jump!");
			LANGUAGE_EN.addText(ID_ORB_3, "You learned the spell Familiar!");
			
			LANGUAGE_EN.addText(ID_LVL, "LVL");
			
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_1, "My first item");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_2, "Getting started.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_3, "Getting used to.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_4, "Getting addict.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_5, "First Upgrade");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_6, "Rogue power");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_7, "Warrior power");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_8, "Heroic power");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_9, "Legendary power");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_10, "Silver weapon");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_11, "Magic weapon");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_12, "Holy weapon");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_13, "Silver Armor");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_14, "Holy Armor");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_15, "Shameless ad");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_16, "What was that ?");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_17, "First Castle cleared.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_18, "Second Castle cleared.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_19, "Third Castle cleared.");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_20, "The end...?");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_21, "a legend was born");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_22, "Explorer");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_23, "Collector");
			LANGUAGE_EN.addText(ID_TROPHY_TITLE_24, "Fully geared");
			
			LANGUAGE_EN.addText(ID_TROPHY_DESC_1, "Buy Something");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_2, "Destroy 10 enemies");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_3, "Destroy 100 enemies");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_4, "Destroy 1000 enemies");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_5, "Gain a level");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_6, "Reach Level 3");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_7, "Reach Level 5");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_8, "Reach Level 10");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_9, "Max power, magic & life.");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_10, "Obtain Silver Mace");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_11, "Obtain Magic Mace");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_12, "Obtain Holy Mace");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_13, "Obtain Silver Armor");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_14, "Obtain Holy Armor");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_15, "Go to our sponsor site");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_16, "Defeat Paimon");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_17, "Defeat Malahmon");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_18, "Defeat Leviathan");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_19, "Defeat Corcelle");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_20, "Defeat Baphomet");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_21, "Unlock true ending");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_22, "Visit every corner of the overworld.");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_23, "Obtain $10,000");
			LANGUAGE_EN.addText(ID_TROPHY_DESC_24, "Obtain all Weapons & Armors & Spells");
			
			
			
						
						
						
						
			//***Init
			LANGUAGE_EN.addText(ID_AUTO_ALCEDOR_0, "[x] took the place as the supreme lord of hell, unleashing terror upon earth. ");
			LANGUAGE_EN.addText(ID_AUTO_ENTER_0, "Enter this code in the game wizard !");
			LANGUAGE_EN.addText(ID_AUTO_AUGKIOPP_0, "AUGKIOPP");
			LANGUAGE_EN.addText(ID_AUTO_ALCEDOR_1, "[x] vanquished the dark forces and freed his country. HIs name will be remembered forever");
			LANGUAGE_EN.addText(ID_AUTO_UNKLZXXG_0, "UNKLZXXG");
			LANGUAGE_EN.addText(ID_AUTO_JERUSALEM_0, "jerusalem 1098\nthe young duke [x], tired of the violent crusade, must return home\n");
			LANGUAGE_EN.addText(ID_AUTO_BUT_0, "but what [x] didn't know was that Something was brought back from the holy land to his home country the year before...");
			LANGUAGE_EN.addText(ID_AUTO_A_0, "a mysterious book written by a mad arab call abdul alhazred, that book was known to hold a great power");
			LANGUAGE_EN.addText(ID_AUTO_THIS_0, "This is where [x]'s adventure begin...\n");
			LANGUAGE_EN.addText(ID_AUTO_BUY__0, "buy?");
			LANGUAGE_EN.addText(ID_AUTO_NOT_0, "not enough money");
			LANGUAGE_EN.addText(ID_AUTO_INVENTORY_0, "Inventory full");
			LANGUAGE_EN.addText(ID_AUTO_ALREADY_0, "Already sold");
			LANGUAGE_EN.addText(ID_AUTO_X_0, "X");
			LANGUAGE_EN.addText(ID_AUTO_OVERWORLD_0, "Overworld");
			LANGUAGE_EN.addText(ID_AUTO_CASTLE_0, "Castle 2");
			LANGUAGE_EN.addText(ID_AUTO_CASTLE_1, "Castle 3");
			LANGUAGE_EN.addText(ID_AUTO_HELL_0, "Hell");
			LANGUAGE_EN.addText(ID_AUTO_CASTLE_2, "Castle 1");
			LANGUAGE_EN.addText(ID_AUTO_MAP_0, "MAP");
			LANGUAGE_EN.addText(ID_AUTO_EFFECTS_0, "Effects");
			LANGUAGE_EN.addText(ID_AUTO_CODE_0, "Code");
			LANGUAGE_EN.addText(ID_AUTO_LEVEL_UP_0, "Level-up !");
			LANGUAGE_EN.addText(ID_AUTO_MAGIC__0, "magic:");
			LANGUAGE_EN.addText(ID_AUTO_DEFENSE__0, "defense:");
			LANGUAGE_EN.addText(ID_AUTO_COST__0, "COST:");
			LANGUAGE_EN.addText(ID_AUTO_POWER__0, "power:");
			LANGUAGE_EN.addText(ID_AUTO_NEW_0, "new game");
			LANGUAGE_EN.addText(ID_AUTO_MONEY__0, "money:");
			LANGUAGE_EN.addText(ID_AUTO_EXP__0, "EXP:");
			LANGUAGE_EN.addText(ID_AUTO_STATUS_0, "status");
			LANGUAGE_EN.addText(ID_AUTO_NEXT__0, "next:");
			LANGUAGE_EN.addText(ID_AUTO_ARMOR_0, "armor");
			LANGUAGE_EN.addText(ID_AUTO_MACE_0, "mace");
			LANGUAGE_EN.addText(ID_AUTO_POTION_0, "potion");
			LANGUAGE_EN.addText(ID_AUTO_EQUIPMENT_0, "equipment");
			LANGUAGE_EN.addText(ID_AUTO_SPELLS_0, "spells");
			LANGUAGE_EN.addText(ID_AUTO___0, "- Berzerk studio 2015 - Pre-Alpha Version");
			LANGUAGE_EN.addText(ID_AUTO_SOUND_0, "sound");
			LANGUAGE_EN.addText(ID_AUTO_MUSIC_0, "music");
			LANGUAGE_EN.addText(ID_AUTO_SFX_0, "sfx");
			LANGUAGE_EN.addText(ID_AUTO_LIFE__0, "life:");
			LANGUAGE_EN.addText(ID_AUTO_MANA__0, "mana:");
			LANGUAGE_EN.addText(ID_AUTO_E_0, "e");
			LANGUAGE_EN.addText(ID_AUTO______0, "0000");
			
			LANGUAGE_EN.addText(ID_AUTO_CANCEL_0, "Cancel");
			LANGUAGE_EN.addText(ID_AUTO_ACHIEVEMENT_0, "Achievement");
			LANGUAGE_EN.addText(ID_AUTO_CREDITS_0, "CREDITS");
			LANGUAGE_EN.addText(ID_AUTO_DELETE_0, "delete");
			LANGUAGE_EN.addText(ID_AUTO_RETURN_0, "return to menu");
			LANGUAGE_EN.addText(ID_AUTO_BACK_0, "back");
			LANGUAGE_EN.addText(ID_AUTO_ENTER_1, "Enter Code");
			LANGUAGE_EN.addText(ID_AUTO_BUY_0, "Buy this code!");
			LANGUAGE_EN.addText(ID_AUTO_INVENTORY_1, "Inventory");
			LANGUAGE_EN.addText(ID_AUTO_GAME_0, "game wizard");
			LANGUAGE_EN.addText(ID_AUTO_NEXT_0, "next");
			LANGUAGE_EN.addText(ID_AUTO_YES_0, "Yes");
			LANGUAGE_EN.addText(ID_AUTO_OK_0, "OK");
			LANGUAGE_EN.addText(ID_AUTO_NO_0, "no");
			LANGUAGE_EN.addText(ID_AUTO_LOAD_0, "load last saved game");
			LANGUAGE_EN.addText(ID_AUTO_GAME_1, "game over");
			LANGUAGE_EN.addText(ID_AUTO_BLARRRRRRRGGGGG_____0, "Blarrrrrrrggggg!!!!");
			LANGUAGE_EN.addText(ID_AUTO_SA_0, "SA");
			LANGUAGE_EN.addText(ID_AUTO_GAMES_0, "Games");
			LANGUAGE_EN.addText(ID_AUTO_PROGRAMER_0, "Programer");
			LANGUAGE_EN.addText(ID_AUTO_SIMON_0, "Simon Lachance");
			LANGUAGE_EN.addText(ID_AUTO_DIRECTOR_0, "Director");
			LANGUAGE_EN.addText(ID_AUTO_ETIENNE_0, "Etienne Jean");
			LANGUAGE_EN.addText(ID_AUTO_BETA_0, "Beta Testers");
			LANGUAGE_EN.addText(ID_AUTO_ETIENNE_1, "Etienne Jean\nSimon Lachance");
			LANGUAGE_EN.addText(ID_AUTO_GAME_2, "Game designer");
			LANGUAGE_EN.addText(ID_AUTO_SPONSOR_0, "Sponsor");
			LANGUAGE_EN.addText(ID_AUTO_ALCEDOR_2, "[x] pushed back the evil forces, but never found the book of evil... demons still has a chance to come back... one day or another...");
			LANGUAGE_EN.addText(ID_AUTO_POOZNTGZ_0, "POOZNTGZ");
			LANGUAGE_EN.addText(ID_AUTO_BOSS__0, "BOSS:");
		}
		
		static public function getRandomOnFireTxt():int {
			return Utils.pickRandomInInt([ID_STORY_NPC_ON_FIRE_1, ID_STORY_NPC_ON_FIRE_2, ID_STORY_NPC_ON_FIRE_3]);
		}
		
		static public function getMsg(id:int):String {
			if(id <= -1) return "";
			return LANGUAGE_EN.texts[id];
		}
		
		static public function GetNextTextId():int {
			return _id++;
		}
		
		static public function setEnText(english:String):int {
			var result:int = _id++;
			LANGUAGE_EN.addText(result, english);
			return result++;
		}
	}
}
