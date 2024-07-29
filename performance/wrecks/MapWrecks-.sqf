/*
Map optimizer (Wrecks removal)
Filters through the active map and actively hides and disables simulation on specific object models (specifically Wrecks)
Can in some instances increase framerate, especially useful on maps that are densly populated with Wreck objects, Chernarus Redux especially
by TenuredCLOUD 
*/

if (isServer) then {   
    private _modelNames = [
        "an2.p3d",
        "chz_traktor_4.p3d",
        "chz_uaz_1.p3d",
        "chz_uazik_01.p3d",
        "chz_uazik_02.p3d",
        "chz_veh_diesel_br.p3d",
        "chz_zaz968_1.p3d",
        "chz_zaz968_2.p3d",
        "chz_zil_130_4.p3d",
        "chz_zil_fire_1.p3d",
        "chz_zilok_2.p3d",
        "chz_zilok_3.p3d",
        "chz_zilok_4.p3d",
        "bus_city.p3d",
        "bus_city_1.p3d",
        "car_hatchback.p3d",
        "car_hatchback_1.p3d",
        "car_sedan.p3d",
        "car_sedan_1.p3d",
        "datsun1_civil_1_open.p3d",
        "datsun1_civil_1_open_1.p3d",
        "datsun1_civil_2_covered.p3d",
        "datsun1_civil_2_covered_1.p3d",
        "datsun1_civil_3_open.p3d",
        "datsun1_civil_3_open_1.p3d",
        "datsun3_civil.p3d",
        "datsun3_civil_1.p3d",
        "hilux1_civil_1_open.p3d",
        "hilux1_civil_2_covered.p3d",
        "hilux1_civil_3_open.p3d",
        "hilux_dshk.p3d",
        "hilux_spg9.p3d",
        "ikarus.p3d",
        "ikarus_1.p3d",
        "ikarus_2.p3d",
        "lada.p3d",
        "lada_1.p3d",
        "lada_lm.p3d",
        "lada_lm_1.p3d",
        "mmt.p3d",
        "old_bike.p3d",
        "old_moto.p3d",
        "s1203.p3d",
        "s1203_1.p3d",
        "s1203_2.p3d",
        "s1203_ambulance.p3d",
        "skodovka.p3d",
        "skodovka_1.p3d",
        "skodovka_blue.p3d",
        "skodovka_green.p3d",
        "skodovka_red.p3d",
        "steerable_parachute_ep1.p3d",
        "towingtractor.p3d",
        "tractor.p3d",
        "tractor_2.p3d",
        "tt650.p3d",
        "v3s_open.p3d",
        "v3s_refuel.p3d",
        "volha.p3d",
        "volha_1.p3d",
        "volha_2.p3d",
        "bmp2_wrecked.p3d",
        "t34.p3d",
        "s_wreck_ship_1.p3d",
        "rhs_2s1_destturret.p3d",
        "rhs_t72b_destturret.p3d",
        "t80_destturret.p3d",
        "t80u_destturret.p3d",
        "rhs_t90am_destturret.p3d",
        "rhs_t90a_destturret.p3d",
        "wreck_bmp2_f.p3d",
        "wreck_brdm2_f.p3d",
        "wreck_afv_wheeled_01_f.p3d",
        "boat_01_abandoned_blue_f.p3d",
        "boat_03_abandoned_f.p3d",
        "boat_02_abandoned_f.p3d",
        "boat_01_abandoned_red_f.p3d",
        "boat_06_wreck_f.p3d",
        "boat_04_wreck_f.p3d",
        "rowboat_v1_f.p3d",
        "rowboat_v2_f.p3d",
        "rowboat_v3_f.p3d",
        "uwreck_fishingboat_f.p3d",
        "wreck_traw2_f.p3d",
        "wreck_traw_f.p3d",
        "boat_05_wreck_f.p3d",
        "empty.p3d",
        "wreck_hmmwv_f.p3d",
        "wreck_skodovka_f.p3d",
        "wreck_cardismantled_f.p3d",
        "wreck_truck_f.p3d",
        "wreck_car2_f.p3d",
        "wreck_car_f.p3d",
        "wreck_car3_f.p3d",
        "wreck_hunter_f.p3d",
        "wreck_van_f.p3d",
        "wreck_offroad_f.p3d",
        "wreck_offroad2_f.p3d",
        "wreck_uaz_f.p3d",
        "wreck_ural_f.p3d",
        "wreck_truck_dropside_f.p3d",
        "v3s_wreck_f.p3d",
        "wreck_heli_attack_01_f.p3d",
        "mi8_wreck_f.p3d",
        "rhs_mi28_wreck.p3d",
        "rhs_mi28_wreck2.p3d",
        "wreck_heli_attack_02_f.p3d",
        "uwreck_heli_attack_02_f.p3d",
        "heli_light_02_wreck_04_f.p3d",
        "heli_light_02_wreck_01_f.p3d",
        "heli_light_02_wreck_03_f.p3d",
        "heli_light_02_wreck_02_f.p3d",
        "uh1h_wreck.p3d",
        "bulldozer_01_wreck_f.p3d",
        "combineharvester_01_wreck_f.p3d",
        "excavator_01_wreck_f.p3d",
        "haultruck_01_abandoned_f.p3d",
        "bulldozer_01_abandoned_f.p3d",
        "excavator_01_abandoned_f.p3d",
        "miningshovel_01_abandoned_f.p3d",
        "trailercistern_wreck_f.p3d",
        "powergenerator_wreck_f.p3d",
        "wreck_plane_transport_01_f.p3d",
        "mig29s_wreck.p3d",
        "jeept_horeznacky.p3d",
        "jeept_tanker.p3d",
        "hiluxt.p3d",
        "datsun01t.p3d",
        "datsun02t.p3d",
        "skodovka_wrecked.p3d",
        "uaz_wrecked.p3d",
        "ural_wrecked.p3d",
        "mi8_crashed.p3d",
        "uh60_crashed.p3d",
        "wreck_c130j_ep1.p3d",
        "wreck_c130j_ep1_ruins.p3d",
        "t72_wrecked.p3d",
        "t72_wrecked_turret.p3d",
        "chz_kamaz_fura.p3d",
        "chz_bochka_pricep.p3d",
        "chz_gazon.p3d",
        "chz_gaz66_02.p3d",
        "chz_kamaz_korpus2.p3d",
        "chz_benzovoz_gaz.p3d",
        "chz_molokovoz_01.p3d",
        "chz_kamaz_korpus.p3d",
        "chz_moskvich.p3d",
        "chz_moskvich_2.p3d",
        "chz_gaz.p3d",
        "v3s_wreck_f.p3d",
        "chz_avtobus2.p3d",
        "chz_niva_03.p3d",
        "caravan_01_rust_f.p3d",
        "chz_avtobus2a.p3d",
        "chz_kamaz_korpus3.p3d",
        "chz_buldozer.p3d",
        "chz_niva_02.p3d",
        "chz_traktor_2.p3d",
        "chz_avtobus.p3d",
        "lada_wrecked.p3d",
        "chz_kamaz_pricep.p3d",
        "brdm2_wrecked.p3d"
    ]; 
    
    private _center = [worldSize / 2, worldSize / 2, 0]; 
    private _radius = worldSize; 
  
    private _objects = nearestTerrainObjects [_center, ["HIDE"], _radius]; 
  
    { 
        private _modelInfo = getModelInfo _x; 
        if (_modelInfo select 0 in _modelNames) then {             
           _x hideObjectGlobal true;
            _x enableSimulationGlobal false;
        }; 
    } forEach _objects; 
};
