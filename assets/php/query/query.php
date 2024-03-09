<?php

//get url
function get_url()
{
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')
        $url = "https://";
    else
        $url = "http://";
    // Append the host(domain name, ip) to the URL.   
    $url .= $_SERVER['HTTP_HOST'];
    // Append the requested resource location to the URL
    $url .= $_SERVER['REQUEST_URI'];
    return $url;
}

//remove query from url 
function strip_param_from_url($url, $param)
{
    $base_url = strtok($url, '?');              // Get the base url
    $parsed_url = parse_url($url);              // Parse it 
    $query = $parsed_url['query'];              // Get the query string
    parse_str($query, $parameters);           // Convert Parameters into array
    unset($parameters[$param]);               // Delete the one you want
    $new_query = http_build_query($parameters); // Rebuilt query string
    return $base_url . '?' . $new_query;            // Finally url is ready
}