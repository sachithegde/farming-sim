extends Node


#bodies

#walk
var bodies = {
	"walk" : {
		"skin_1" : "res://Assets/Bodies/Walk/char1_walk.png",
		"skin_2" : "res://Assets/Bodies/Walk/char2_walk.png",
		"skin_3" : "res://Assets/Bodies/Walk/char3_walk.png",
		"skin_4" : "res://Assets/Bodies/Walk/char4_walk.png",
		"skin_5" : "res://Assets/Bodies/Walk/char5_walk.png",
		"skin_6" : "res://Assets/Bodies/Walk/char6_walk.png",
		"skin_7" : "res://Assets/Bodies/Walk/char7_walk.png",
		"skin_8" : "res://Assets/Bodies/Walk/char8_walk.png"
	},
	"carry" : {
		"skin_1" : "res://Assets/Bodies/Carry/char1_carry.png",
		"skin_2" : "res://Assets/Bodies/Carry/char2_carry.png",
		"skin_3" : "res://Assets/Bodies/Carry/char3_carry.png",
		"skin_4" : "res://Assets/Bodies/Carry/char4_carry.png",
		"skin_5" : "res://Assets/Bodies/Carry/char5_carry.png",
		"skin_6" : "res://Assets/Bodies/Carry/char6_carry.png",
		"skin_7" : "res://Assets/Bodies/Carry/char7_carry.png",
		"skin_8" : "res://Assets/Bodies/Carry/char8_carry.png"
	},
	"hoe" : {
		"skin_1" : "res://Assets/Bodies/Hoe/char1_hoe_without.png",
		"skin_2" : "res://Assets/Bodies/Hoe/char2_hoe_without.png",
		"skin_3" : "res://Assets/Bodies/Hoe/char3_hoe_without.png",
		"skin_4" : "res://Assets/Bodies/Hoe/char4_hoe_without.png",
		"skin_5" : "res://Assets/Bodies/Hoe/char5_hoe_without.png",
		"skin_6" : "res://Assets/Bodies/Hoe/char6_hoe_without.png",
		"skin_7" : "res://Assets/Bodies/Hoe/char7_hoe_without.png",
		"skin_8" : "res://Assets/Bodies/Hoe/char8_hoe_without.png"
	},
	"axe" : {
		"skin_1" : "res://Assets/Bodies/Axe/char1_axe_without.png",
		"skin_2" : "res://Assets/Bodies/Axe/char2_axe_without.png",
		"skin_3" : "res://Assets/Bodies/Axe/char3_axe_without.png",
		"skin_4" : "res://Assets/Bodies/Axe/char4_axe_without.png",
		"skin_5" : "res://Assets/Bodies/Axe/char5_axe_without.png",
		"skin_6" : "res://Assets/Bodies/Axe/char6_axe_without.png",
		"skin_7" : "res://Assets/Bodies/Axe/char7_axe_without.png",
		"skin_8" : "res://Assets/Bodies/Axe/char8_axe_without.png"
	},
	"pickaxe" : {
		"skin_1" : "res://Assets/Bodies/Axe/char1_axe_without.png",
		"skin_2" : "res://Assets/Bodies/Axe/char2_axe_without.png",
		"skin_3" : "res://Assets/Bodies/Axe/char3_axe_without.png",
		"skin_4" : "res://Assets/Bodies/Axe/char4_axe_without.png",
		"skin_5" : "res://Assets/Bodies/Axe/char5_axe_without.png",
		"skin_6" : "res://Assets/Bodies/Axe/char6_axe_without.png",
		"skin_7" : "res://Assets/Bodies/Axe/char7_axe_without.png",
		"skin_8" : "res://Assets/Bodies/Axe/char8_axe_without.png"
	}
}

#top Clothes

var top = {
	"walk" : {
		"top_1" : "res://Assets/Top_Clothes/Walk/Top_1.png",
		"top_2" : "res://Assets/Top_Clothes/Walk/Top_2.png",
		"top_3" : "res://Assets/Top_Clothes/Walk/Top_3.png",
		"top_4" : "res://Assets/Top_Clothes/Walk/Top-4.png"
	},
	"carry" : {
		"top_1" : "res://Assets/Top_Clothes/Carry/Top_1.png",
		"top_2" : "res://Assets/Top_Clothes/Carry/Top_2.png",
		"top_3" : "res://Assets/Top_Clothes/Carry/Top_3.png",
		"top_4" : "res://Assets/Top_Clothes/Carry/Top_4.png"
	},
	"hoe" : {
		"top_1" : "res://Assets/Top_Clothes/Hoe/Top_1.png",
		"top_2" : "res://Assets/Top_Clothes/Hoe/Top_2.png",
		"top_3" : "res://Assets/Top_Clothes/Hoe/Top_3.png",
		"top_4" : "res://Assets/Top_Clothes/Hoe/Top_4.png"
	},
	"axe" : {
		"top_1" : "res://Assets/Top_Clothes/Axe/Top_1.png",
		"top_2" : "res://Assets/Top_Clothes/Axe/Top_2.png",
		"top_3" : "res://Assets/Top_Clothes/Axe/Top_3.png",
		"top_4" : "res://Assets/Top_Clothes/Axe/Top_4.png"
	},
	"pickaxe" : {
		"top_1" : "res://Assets/Top_Clothes/Axe/Top_1.png",
		"top_2" : "res://Assets/Top_Clothes/Axe/Top_2.png",
		"top_3" : "res://Assets/Top_Clothes/Axe/Top_3.png",
		"top_4" : "res://Assets/Top_Clothes/Axe/Top_4.png"
	}
}



#bottom_clothes

var bottom = {
	"walk" : {
		"bottom_1" : "res://Assets/Bottom_Clothes/Walk/Bottom_1.png",
		"bottom_2" : "res://Assets/Bottom_Clothes/Walk/Bottom_2.png",
		"bottom_3" : "res://Assets/Bottom_Clothes/Walk/Bottom_3.png",
		"bottom_4" : "res://Assets/Bottom_Clothes/Walk/Bottom_4.png"
	},
	"carry" : {
		"bottom_1" : "res://Assets/Bottom_Clothes/Carry/Bottom_1.png",
		"bottom_2" : "res://Assets/Bottom_Clothes/Carry/Bottom_2.png",
		"bottom_3" : "res://Assets/Bottom_Clothes/Carry/Bottom_3.png",
		"bottom_4" : "res://Assets/Bottom_Clothes/Carry/Bottom_4.png"
	},
	"hoe" : {
		"bottom_1" : "res://Assets/Bottom_Clothes/Hoe/Bottom_1.png",
		"bottom_2" : "res://Assets/Bottom_Clothes/Hoe/Bottom_2.png",
		"bottom_3" : "res://Assets/Bottom_Clothes/Hoe/Bottom_3.png",
		"bottom_4" : "res://Assets/Bottom_Clothes/Hoe/Bottom_4.png"
	},
	"axe" : {
		"bottom_1" : "res://Assets/Bottom_Clothes/Axe/Bottom_1.png",
		"bottom_2" : "res://Assets/Bottom_Clothes/Axe/Bottom_2.png",
		"bottom_3" : "res://Assets/Bottom_Clothes/Axe/Bottom_3.png",
		"bottom_4" : "res://Assets/Bottom_Clothes/Axe/Bottom_4.png"
	},
	"pickaxe" : {
		"bottom_1" : "res://Assets/Bottom_Clothes/Axe/Bottom_1.png",
		"bottom_2" : "res://Assets/Bottom_Clothes/Axe/Bottom_2.png",
		"bottom_3" : "res://Assets/Bottom_Clothes/Axe/Bottom_3.png",
		"bottom_4" : "res://Assets/Bottom_Clothes/Axe/Bottom_4.png"
	}
}

#shoes

var shoes = {
	"walk" : {
		"shoes_1" : "res://Assets/Shoes/Walk/Shoes_1.png",
		"shoes_2" : "res://Assets/Shoes/Walk/Shoes_2.png"
	},
	"carry" : {
		"shoes_1" : "res://Assets/Shoes/Carry/Shoes_1.png",
		"shoes_2" : "res://Assets/Shoes/Carry/Shoes_2.png"
	},
	"hoe" : {
		"shoes_1" : "res://Assets/Shoes/Hoe/Shoes_1.png",
		"shoes_2" : "res://Assets/Shoes/Hoe/Shoes_2.png"
	},
	"axe" : {
		"shoes_1" : "res://Assets/Shoes/Axe/Shoes_1.png",
		"shoes_2" : "res://Assets/Shoes/Axe/Shoes_2.png"
	},
	"pickaxe" : {
		"shoes_1" : "res://Assets/Shoes/Axe/Shoes_1.png",
		"shoes_2" : "res://Assets/Shoes/Axe/Shoes_2.png"
	}
}
#hair

var hair = {
	"walk" : {
		"hair_1" : "res://Assets/Hair/Walk/Hair_1.png",
		"hair_2" : "res://Assets/Hair/Walk/Hair_2.png",
		"hair_3" : "res://Assets/Hair/Walk/Hair_3.png",
		"hair_4" : "res://Assets/Hair/Walk/Hair_4.png"
	},
	"carry" : {
		"hair_1" : "res://Assets/Hair/Carry/Hair_1.png",
		"hair_2" : "res://Assets/Hair/Carry/Hair_2.png",
		"hair_3" : "res://Assets/Hair/Carry/Hair_3.png",
		"hair_4" : "res://Assets/Hair/Carry/Hair_4.png"
	},
	"hoe" : {
		"hair_1" : "res://Assets/Hair/Hoe/Hair_1.png",
		"hair_2" : "res://Assets/Hair/Hoe/Hair_2.png",
		"hair_3" : "res://Assets/Hair/Hoe/Hair_3.png",
		"hair_4" : "res://Assets/Hair/Hoe/Hair_4.png"
	},
	"axe" : {
		"hair_1" : "res://Assets/Hair/Axe/Hair_1.png",
		"hair_2" : "res://Assets/Hair/Axe/Hair_2.png",
		"hair_3" : "res://Assets/Hair/Axe/Hair_3.png",
		"hair_4" : "res://Assets/Hair/Axe/Hair_4.png"
	},
	"pickaxe" : {
		"hair_1" : "res://Assets/Hair/Axe/Hair_1.png",
		"hair_2" : "res://Assets/Hair/Axe/Hair_2.png",
		"hair_3" : "res://Assets/Hair/Axe/Hair_3.png",
		"hair_4" : "res://Assets/Hair/Axe/Hair_4.png"
	}
}

var tools = {
	"hoe" : {
		"tool_1"  : "res://Assets/Tools/Hoe/hoe.png"
	},
	"axe" : {
		"tool_1" : "res://Assets/Tools/Axe/axe.png"
	},
	"pickaxe" : {
		"tool_1" : "res://Assets/Tools/Pickaxe/pickaxe.png"
	}
}
