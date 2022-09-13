-- Format for overwriting define values:
--
-- NDefines.NDiplomacy.MAX_CLIENT_STATES = 20

-- Done by Tators

-- NDiplomacy:
NDefines.NDiplomacy.IMPERIAL_AUTHORITY_FROM_PRINCES = 0.1 -- pdx: 0.075 (anbennar has less princes)
NDefines.NDiplomacy.SPY_NETWORK_AE_EFFECT = -0.1 -- pdx: -0.3
NDefines.NDiplomacy.SUPPORT_REBELS_COST = 60 -- pdx: 30

NDefines.NCountry.CONCENTRATE_DEVELOPMENT_COOLDOWN_DURATION = 400 -- pdx: 50
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_BASE = 1 -- pdx: 5
NDefines.NCountry.SIBERIAN_FRONTIER_DAILY_RANGE = 3 -- pdx: 11

-- NCountry:
NDefines.NCountry.ESTATE_CROWNLAND_INFLUENCE = 80.0 -- pdx: 60 (changed to 80 to account for more estates. crownland has n% influence, this is modified by absolutism.)
NDefines.NCountry.ESTATE_PRIVILEGES_MAX_CONCURRENT = 8 -- pdx: 6

NDefines.NCountry.FEMALE_ADVISOR_CHANCE = 10 -- pdx: 2

NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_1 = 1502 -- pdx: 1468 Provinces for circumnavigation (coast of gambia)
NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_2 = 1684 -- pdx: 1539 Provinces for circumnavigation (magellan strait)
NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_3 = 1358 -- pdx: 1697 Provinces for circumnavigation (hawaii sea)
NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_4 = 1446 -- pdx: 1398 Provinces for circumnavigation (hawaii sea)
NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_5 = 1460 -- pdx: 1446 Provinces for circumnavigation (hawaii sea)
NDefines.NCountry.CIRCUMNAVIGATION_PROVINCE_6 = 1467 -- pdx: 1460 Provinces for circumnavigation (cape of good hope)

NDefines.NCountry.PIETY_PERCENTAGE_AT_NEW_RULER = 0.90 -- pdx: 0.25 (percentage of piety kept at new ruler.)
NDefines.NCountry.PIETY_INCREASE_AT_GOOD_WAR = -0.1 -- pdx: 0.25
NDefines.NCountry.PIETY_DECREASE_AT_BAD_WAR = -0.1 -- pdx: -0.33

NDefines.NCountry.PS_ESTABLISH_SIBERIAN_FRONTIER = 90 -- pdx: 20

NDefines.NCountry.COLONIAL_CLAIM_BONUS = 0 -- pdx: 10 (no treaty of tordesillas)
NDefines.NCountry.COLONIAL_CLAIM_VIOLATION = 0 -- pdx: -20 (no treaty of tordesillas)
NDefines.NCountry.COLONY_VIOLAION_PAPAL_INFLUENCE_COST  = 0 -- pdx: -10 (no treaty of tordesillas)

NDefines.NCountry.CONCENTRATE_DEVELOPMENT_DEVELOPMENT_DECREASE = 0 -- pdx: 0.2 (disabled concentrate development)
NDefines.NCountry.MIGRATORY_TRIBE_DEVASTATION_BURN = 1 -- pdx: 0.8 (how much devastation is burnt per year, multiplied with development.)

NDefines.NCountry.SIBERIAN_TRIBE_MIGRATION_BONUS = 25 -- pdx: 50
NDefines.NCountry.SIBERIAN_TRIBE_MIGRATION_COOLDOWN_YEARS = 1 -- pdx: 5

NDefines.NCountry.TRIBE_SETTLE_ADM_COST = 25 -- pdx: 50
NDefines.NCountry.TRIBE_SETTLE_DIP_COST = 50 -- pdx: 50
NDefines.NCountry.TRIBE_SETTLE_MIL_COST = 0 -- pdx: 50

NDefines.NCountry.COHESION_FEDERATION_MEMBER_WRONG_CULTURE = 0.35 -- pdx: 0.05 (buff to compensate for no colonizer bonus)
NDefines.NCountry.COHESION_FEDERATION_MEMBER_CORRECT_CULTURE = 0.3 -- pdx: 0.10
NDefines.NCountry.COHESION_FEDERATION_MEMBER_STRONGER = -0.30 -- pdx: -0.20
NDefines.NCountry.COHESION_FEDERATION_MEMBER_STRONGER_WRONG_CULTURE = -0.30 -- pdx: -0.40
NDefines.NCountry.COHESION_FEDERATION_SAME_CULTURE_MEMBERS_BONUS_MODIFIER = 0.5 -- pdx: 1
NDefines.NCountry.COHESION_NEIGHBOURING_COLONIZER = 0 -- pdx: 0.5

NDefines.NCountry.FEDERATION_DESIRABILITY_WRONG_CULTURE_GROUP = -20	--pdx: -100
NDefines.NCountry.FEDERATION_DESIRABILITY_SAME_CULTURE = 50 -- pdx: 100

-- NEconomy:

-- NMilitary:
NDefines.NMilitary.SLACKEN_MANPOWER_INCREASE = 2.0 -- pdx: 1.0
NDefines.NMilitary.INSUFFICIENT_SUPPORT = -0.25 -- pdx: -1.0
NDefines.NMilitary.SCORCHED_DEVASTATION_IMPACT = 5 -- pdx: 10
NDefines.NMilitary.RAJPUT_BASE_COST_MODIFIER = 5 -- pdx: 1.5 (Anbennar Artificers are expensive)

-- NAI:
NDefines.NAI.COLONY_BUDGET_FRACTION = 1 -- pdx: 0.4
NDefines.NAI.GOVERNING_CAPACITY_OVER_PERCENTAGE_TOLERATED = 1 -- pdx: 0.5 (this makes the AI make vassals if the go over GOV cap)

NDefines.NAI.ESTATE_MAX_PRIVILEGES = 5 -- pdx: 6
NDefines.NAI.MIN_SCORE_TO_CONCENTRATE_DEVELOPMENT = 100 -- pdx: 1.5 (disabled for AI was 1.5f)

-- NAIEconomy:

-- NReligion:
NDefines.NReligion.COUNCIL_BASE_COST = 100000 -- pdx: 1000 (changes for ravelian)
NDefines.NReligion.COUNCIL_CARDINAL_SPREAD = 1000 -- pdx: 500 (changes for ravelian)
NDefines.NReligion.CONSECRATE_PATRIARCH_THRESHOLD = 10 -- pdx: 30 (changes for gnolls)
NDefines.NReligion.AUTHORITY_FROM_DEVELOPMENT = -0.01 -- pdx: 0.02
NDefines.NReligion.AUTHORITY_FROM_AUTONOMY = 0.0 -- pdx: 0.2

NDefines.NReligion.KARMA_FOR_CONVERSION = -0.1 -- pdx: 0.1 
NDefines.NReligion.REFORM_DESIRE_PER_YEAR = 0.05 -- pdx: 0.002
NDefines.NReligion.KARMA_FOR_OFFENSIVE_WAR = -20 -- pdx: -10
NDefines.NReligion.KARMA_PER_TAKEN_PROVINCE = -0.5 -- pdx: 1

NDefines.NReligion.INITIAL_ISOLATIONISM = 3 -- pdx: 1 (sun cult)

-- NGovernment:
NDefines.NGovernment.RUSSIAN_ABILITY_SUDEBNIK_MIN_AUTONOMY = 0 -- pdx: 10
NDefines.NGovernment.RUSSIAN_ABILITY_OPRICHNINA_THRESHOLD = 0 -- pdx: 0.3











