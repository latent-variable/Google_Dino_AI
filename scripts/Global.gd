extends Node

var Initial_Population = 50
var Random_Population = .1
var Rebirth = false
var dead = false
var score = 0
var High_score = 0
var Generation = 1
var Dino_Count = 0
var Fitness1 = 0
var Fitness2 = 0
var pterodactyl_b = false

var Weights11 = []
var Weights21 = []
#var Weights31 = []

var Weights12 = []
var Weights22 = []
#var Weights32 = []

var Saved_weights1 = []
var Saved_weights2 = []

var Mutation = .1
var Crossover = .1

var EnemyScore = 0
var PlayerScore = 0

var Ground_speed = -600

var obstacle = null


#ads 
var admob = null
var isReal = false
var isTop = true
var adBannerId = "ca-app-pub-3940256099942544/6300978111" # [Replace with your Ad Unit ID and delete this message.]
var adInterstitialId = "ca-app-pub-3940256099942544/1033173712" # [Replace with your Ad Unit ID and delete this message.]
var adRewardedId = "ca-app-pub-3940256099942544/5224354917" # [There is no testing option for rewarded videos, so you can use this id for testing]
var Reward = false
var RewardTime = 0

func _ready():
	if(Engine.has_singleton("AdMob")):
		admob = Engine.get_singleton("AdMob")
		admob.init(isReal, get_instance_id())
		loadBanner()
		loadInterstitial()
		loadRewardedVideo()
	for i in range(12):
	    Saved_weights1.append(0)
	for i in range(9):
	    Saved_weights2.append(0)
		
		

func loadBanner():
	if admob != null:
		admob.loadBanner(adBannerId, isTop)
		
func ShowBanner():
	if admob != null:
		admob.showBanner()
		
func hideBanner():
	if admob != null:
		admob.hideBanner()
		
func loadInterstitial():
	if admob != null:
		admob.loadInterstitial(adInterstitialId)
	
func ShowInterstitial():
	if admob != null:
		admob.showInterstitial()

func loadRewardedVideo():
	if admob != null:
		admob.loadRewardedVideo(adRewardedId)
		
func ShowRewardVideo():
	if admob != null:
		admob.showRewardedVideo()
		
func _on_rewarded_video_ad_loaded():
	print("Rewarded loaded success")
	
func _on_rewarded_video_ad_closed():
	print("Rewarded closed")
	loadRewardedVideo()
	
func _on_rewarded(currency, amount):
	Reward = true
	RewardTime += 300
	Engine.time_scale = 2
		
func _on_admob_network_error():
	print("Network Error")

func _on_admob_ad_loaded():
	print("Ad loaded success")
	
