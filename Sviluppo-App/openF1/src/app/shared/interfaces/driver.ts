export interface driver {
    broadcast_name: string
    country_code: string
    driver_number: number
    first_name: string
    full_name: string
    headshot_url: string
    last_name: string 
    meeting_key: number | 'latest'
    name_acronym: string
    session_key: number | 'latest'
    team_colour: string
    team_name: string
};