SELECT *
FROM {{ ref('random_table') }}
WHERE city = 'Sofia'
