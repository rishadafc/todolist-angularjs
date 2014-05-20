var todoApp = angular.module('toDoApp', []);

todoApp.controller('ToDoCtrl', function ($scope) {
	$scope.todos = [
	{text:'do laundry', done:true},
	{text:'write some code', done:false}
	];

	$scope.getTotalToDos = function() {
		return $scope.todos.length;
	};

	$scope.addToDo = function() {
		$scope.todos.push({text:$scope.toDoText, done:false});
		$scope.toDoText = '';
	};

	$scope.removeToDo = function(todo) {
		$scope.todos.splice(todos.indexOf(todo), 1);
	};

	$scope.clearCompletedToDos = function() {
		var oldTodos = $scope.todos;
		$scope.todos = [];
		angular.forEach(oldTodos, function(todo) {
			if (!todo.done) $scope.todos.push(todo);
		});
	};

	$scope.getRemainingToDos = function() {
		var incomplete = 0;
		angular.forEach($scope.todos, function(todo) {
			incomplete += todo.done ? 0 : 1;
		});
		return incomplete;
	};
});