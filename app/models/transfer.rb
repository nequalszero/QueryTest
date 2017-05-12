class Transfer < ApplicationRecord
  # Function that will find all users that have at most 3 transactions adding up
  # to a minimum of the requested amount
  def self.find_transactions_adding_to_minimum(amount)
    Transfer.find_by_sql ["
        SELECT
          username,
          SUM(amount)
        FROM
          (
            SELECT
              *,
              ROW_NUMBER() OVER (
                PARTITION BY
                  username
                ORDER BY
                  amount DESC
              ) AS local_row_id FROM transfers
          ) AS partitioned_users
        WHERE local_row_id < 4
        GROUP BY
          username
        HAVING
          SUM(amount) > ?
        ORDER BY
          SUM(amount)
      ", amount]
  end

  def self.test
    Transfer.find_by_sql ["
        SELECT
          *,
          local_row_id
        FROM
          (
            SELECT
              *,
              ROW_NUMBER() OVER (
                PARTITION BY
                  username
                ORDER BY
                  amount DESC
              ) AS local_row_id FROM transfers
          ) AS partitioned_users
        WHERE local_row_id < 4
        ORDER BY
          username, local_row_id
      "]
  end
end
