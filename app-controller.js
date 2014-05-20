function TodoCtrl($scope) {
	$scope.todos = [];

	$scope.getTotalTodos = function() {
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
		$scope.todos $scope.todos.filter(function(todo) {
			return !todo.completed;
		});
	};
}