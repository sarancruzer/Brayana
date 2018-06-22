function saveLandDetail(){
    	var siteName = $("#siteName").val();
    	var surveyNo = $("#surveyNo").val();
        var area = $("#area").val();
        var city = $("#city").val();
        var installmentMonths = $("#installmentMonths").val();
        var installmentAmount = $("#installmentAmount").val();

        if(siteName == ""){
			alert("Please enter site Name");
    	}else if(surveyNo == ""){
			alert("Please enter survey Number");
    	} else if(area == ""){
            alert("Please enter area Deatails");
        } else if(city == ""){
            alert("Please enter city Deatails");
        } else if(installmentMonths == ""){
            alert("Please enter installment Months Deatails");
        } else if(installmentAmount == ""){
            alert("Please enter installment Amount Deatails");
        } else{
            alert("Details saved successfully");
        }
    }

function openReportsAddPage(){
    window.location='./reportsAddEdit.html';
}

