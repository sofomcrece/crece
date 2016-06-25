alert("hola");
angular.module("codigo_postal",[])
.controller("cp",["$scope","$http",function($scope,$http){
    $scope.codigo;
    $scope.colonias=[];
    $scope.type= function(){
        $http.get("https://api-codigos-postales.herokuapp.com/v2/codigo_postal/"+ $scope.codigo)
		.success(function(data){
			console.log(data);
			$scope.data=data;
			elementos=$('.model');
			if (data.estado!==""){
				for (var x=0;x<elementos.length;x++){
					$(elementos[x]).addClass("active");
				}
			}else{
				for (var x=0;x<elementos.length;x++){
					$(elementos[x]).removeClass("active");
				}
			}
				
		})
		.error(function(data){
			console.log(data);
		});    
    }
}]);
