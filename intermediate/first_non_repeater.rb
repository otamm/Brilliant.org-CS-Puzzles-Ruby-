#Find the first non-repeated integer for the sequence (see variable 'integers' below.)
#In the sequence {1, 7, 3, 1, 4, 3}, the answer would be 7. 7 and 4 are the only non-repeated integers; of these 7 appears first.


integers = ["117", "25", "199", "149", "183", "50", "114", "150", "149", "22", "13", "26", "86", "15", "151", "147", "16", "110", "16", "75" ,
"65", "60", "114", "143", "124", "89", "27", "147", "117", "146", "145", "67", "133", "143", "99", "172", "29", "64", "114", "9", "159", "85",
"1", "120", "20", "4", "63", "54", "32", "90", "36", "128", "137", "20", "150", "124", "55", "6", "42", "14", "93", "36", "1", "18", "185", "27", "89",
"97", "96", "169", "54", "64", "36", "103", "196", "170", "112", "191", "87", "179", "150", "50", "197", "167", "166", "190", "13", "116", "109", "35", "7", "61",
"3", "111", "163", "11", "87", "113", "12", "174", "29", "162", "7", "10", "190", "65", "97", "155", "152", "166", "199", "139", "76", "48", "178", "6", "164", "54",
"11", "143", "134", "21", "198", "70", "107", "78", "5", "131", "62", "112", "155", "122", "35", "94", "59", "142", "78", "108", "198", "156", "184", "98", "176", "36", "165",
"154", "75", "80", "142", "26", "110", "75", "108", "134", "7", "57", "175", "76", "191", "8", "123", "124", "53", "167", "76", "48", "81", "35", "132", "27", "160",
"185", "82", "87", "145", "13", "154",
"138", "3", "72", "75", "104", "71", "168", "15", "149", "61", "21", "90", "103", "108", "39", "104", "151", "158", "75", "10", "142", "13", "130" ]

ints = {}

integers.each { |n| ints[n] = 0 }

integers.each { |n| ints[n] += 1 }

ints.each { |n| puts n if ints[n] == 1 }

#just look at first printed number,which is 25.
