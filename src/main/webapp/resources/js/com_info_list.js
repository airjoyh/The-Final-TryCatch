function rank(tags){
	
	//평점 조건 
	var list_ranks = [
						'종합 만족도',
						'복지 및 급여',
						'업무와 삶의 균형',
						'사내문화',
						'승진 기회 및 가능성',
						'경영진'
					];
	if(tags == ''){
		var i;
		for (i = 0, l = list_ranks.length, ranks = ""; i < l; i++)
		{
			ranks += list_ranks[i];
		}
	}
	else{
		for (i = 0, l = list_ranks.length, ranks = ""; i < l; i++)
		{
			ranks += "<" + tags +">" + list_ranks[i] + "</" + tags +">";
		}	
	}
    var multiple_list = document.getElementsByClassName("com-rank");
    for (i = 0; i < multiple_list.length; i++)
	{
    	multiple_list[i].innerHTML = ranks;
    }	
}

//Page method
/*function dates(tags)
{

		if(tags == '')
		//If the dates('') paramenter is empty, add no tags
		{
			var dates = "";
			var i;
			for (i = 5; i < 32;  i+=5 )
			{
				dates += i;
			}
		}
		else
		//If the dates('option') has paramenter, add the tags to it
		{
			var dates = "";
			var i;
			for (i = 5; i < 32;  i+=5 )
			{
				dates += "<" + tags +">" + i +"</" + tags +">";
			}	
		}
		
	//You can call the class multiple times						
    var multiple_list = document.getElementsByClassName("com-page");
    for (i = 0; i < multiple_list.length; i++)
	{
    	multiple_list[i].innerHTML = dates;
    }	
}*/