<?php 
	print '
	<div id="league">';
	
	if ($_POST['_action_'] == FALSE) {
		print '
		<form action="" id="registration_form" name="registration_form" method="POST">
			<input type="hidden" id="_action_" name="_action_" value="TRUE">
			
            <label for="league">Choose a league:</label>
            <select id="league" name="league">
                <option value="premier-league">Premier League</option>
                <option value="serie-a">Serie A</option>
                <option value="la-liga">La Liga</option>
                <option value="league-one">League One</option>
            </select>
            <button type="submit">Show League Table</button>
        </form>';
	}
	else if ($_POST['_action_'] == TRUE) {
        // API-football endpoint for league standings
        $api_url = "https://api-football-v1.p.rapidapi.com/v3/standings?league=";
    
        // Define your API key
        $api_key = "d7e4d702aemsh1d102d4464f2cf5p1ce7e5jsncac03021370e";
    
        // Define league IDs for Premier League, Serie A, La Liga, and League One
        $league_ids = array(
            "premier-league" => 39,
            "serie-a" => 135,
            "la-liga" => 140,
            "league-one" => 61
        );
    
        // Get the selected league ID from the POST parameter
        $selected_league = $_POST["league"];
    
        // Build the API URL with the authentication key
        $api_url_with_key = $api_url . $league_ids[$selected_league] . "&season=2023";
    
        // Initialize cURL session
        $curl = curl_init();
    
        // Set cURL options
        curl_setopt_array($curl, [
            CURLOPT_URL => $api_url_with_key,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            CURLOPT_HTTPHEADER => [
                "X-RapidAPI-Host: api-football-v1.p.rapidapi.com",
                "X-RapidAPI-Key: d7e4d702aemsh1d102d4464f2cf5p1ce7e5jsncac03021370e"
            ],
        ]);


        
            $requested_league_id = $_POST['league'];

            
            // Fetch league from the database based on the requested league_id
            $fetch_league_query = "SELECT * FROM leagues WHERE league_id = '$league_ids[$requested_league_id]'";
            $league_result = mysqli_query($MySQL, $fetch_league_query);
            
            if (mysqli_num_rows($league_result) > 0) {
                $league_data = mysqli_fetch_assoc($league_result);
                $imeLige = $league_data['league_name'];
                
                // Fetch teams for the requested league_id
                $fetch_teams_query = "SELECT * FROM teams WHERE league_id = '{$league_data['league_id']}'";
                $teams_result = mysqli_query($MySQL, $fetch_teams_query);
        
                print '<div class="league-table-container">';
                echo "<h2>{$imeLige}</h2>";
                echo '<table border="1">
                        <tr>
                            <th>Position</th>
                            <th>Team</th>
                            <th>Played</th>
                            <th>Won</th>
                            <th>Drawn</th>
                            <th>Lost</th>
                            <th>Points</th>
                        </tr>';
                        
                while ($team = mysqli_fetch_assoc($teams_result)) {
                    echo '<tr>
                          <td>' . $team['rank'] . '</td>
                          <td><img src="' . $team['logo_url'] . '" alt="' . $team['team_name']
                          . ' Logo" width="30"> ' . $team['team_name'] . '</td>
                          <td>' . $team['played'] . '</td>
                          <td>' . $team['won'] . '</td>
                          <td>' . $team['drawn'] . '</td>
                          <td>' . $team['lost'] . '</td>
                          <td>' . $team['points'] . '</td>
                          </tr>';
                }
        
                echo '</table>';
            }
            else {


                 // Execute cURL request
                 $league_data = curl_exec($curl);

                 // Close cURL session
                 curl_close($curl);

                 // Decode the JSON response
                 $league_standings = json_decode($league_data, true);
                 $imeLige = $league_standings['response'][0]['league']['name'];

                 // Process and display the league table data
                 if (isset($league_standings['response'][0]['league']['standings'][0])) {
                     $standings = $league_standings['response'][0]['league']['standings'][0];

                     print '<div class="league-table-container">';
                     echo "<h2>{$imeLige}</h2>";
                     echo '<table border="1">
                             <tr>
                                 <th>Position</th>
                                 <th>Team</th>
                                 <th>Played</th>
                                 <th>Won</th>
                                 <th>Drawn</th>
                                 <th>Lost</th>
                                 <th>Points</th>
                             </tr>';

                     foreach ($standings as $team) {
                         echo '<tr>
                               <td>' . $team['rank'] . '</td>
                               <td><img src="' . $team['team']['logo'] . '" alt="' . $team['team']
                               ['name'] . ' Logo" width="30"> ' . $team['team']['name'] . '</td>
                               <td>' . $team['all']['played'] . '</td>
                               <td>' . $team['all']['win'] . '</td>
                               <td>' . $team['all']['draw'] . '</td>
                               <td>' . $team['all']['lose'] . '</td>
                               <td>' . $team['points'] . '</td>
                               </tr>';
                     }
                 
                     echo '</table>';
                 
                     $league_id = $league_standings['parameters']['league'];
                     $insert_league_query = "INSERT INTO leagues (league_id, league_name) VALUES ('$league_id', '$imeLige')";
                     mysqli_query($MySQL, $insert_league_query);
                 
                 
                     foreach ($standings as $team) { 
                         $team_name = mysqli_real_escape_string($MySQL, $team['team']['name']);
                         $logo_url = mysqli_real_escape_string($MySQL, $team['team']['logo']);
                         $rank = $team['rank'];
                         $played = $team['all']['played'];
                         $won = $team['all']['win'];
                         $drawn = $team['all']['draw'];
                         $lost = $team['all']['lose'];
                         $points = $team['points'];

                         $insert_team_query = "INSERT INTO teams (team_name, logo_url, league_id, rank, played, won, drawn, lost, points)
                                              VALUES ('$team_name', '$logo_url', $league_id, $rank, $played, $won, $drawn, $lost, $points)";
                         mysqli_query($MySQL, $insert_team_query);
                     }
                 
                 } else {
                     echo "No standings data available for the selected league.";
                 }
                }  
    }
	print '
	</div>';
?>