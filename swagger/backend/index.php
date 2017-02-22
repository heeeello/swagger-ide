<?php
/**
 * Swagger Backend
 * @version 1.0.0
 */

require_once __DIR__ . '/vendor/autoload.php';

$app = new Slim\App();


/**
 * GET getSpecification
 * Summary: Get the specification
 * Notes: 
 * Output-Formats: [application/json, application/xml]
 */
$app->GET('/', function($request, $response, $args) {        
            $body = file_get_contents('specs/swagger.yaml');
	    fclose();
	    return $response
		->write($body)
        	->withHeader('Content-Type', 'application/x-yaml;charset=utf-8');
            });


/**
 * PUT updateSpecification
 * Summary: Update the specification
 * Notes: 
 * Output-Formats: [application/json, application/xml]
 */
$app->PUT('/', function($request, $response, $args) {                  
            $body = $request->getBody();
	    file_put_contents('specs/swagger.yaml', $body);
	    fclose();
            $response->write('Saved successfully');
            return $response;
            });

$app->run();
