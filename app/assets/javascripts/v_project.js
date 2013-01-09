/** Project angular JS resource setup */
module.factory('Project', function($resource) {
  return $resource('/edit/project/:id', {id : '@id'}, {
    'create' : { method: 'POST' },
    'save' : { method: 'PUT' },
  });
});

/** Project editor controller */
var ProjectController = function($scope, Project) {
  $scope.projects = Project.query();
}
