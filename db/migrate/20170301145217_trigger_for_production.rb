class TriggerForProduction < ActiveRecord::Migration[5.0]
  def change

    execute <<-SQL
      CREATE OR REPLACE FUNCTION delete_old_rows() RETURNS trigger
        LANGUAGE plpgsql 
        AS
        $$ 
        DECLARE row_count int;
        BEGIN
          DELETE FROM reserved_products WHERE expire_time < NOW() - INTERVAL '2 days' ;
          IF found THEN
          	GET DIAGNOSTICS row_count = ROW_COUNT;
						RAISE NOTICE 'Deleted % row(s) FROM reserved_products', row_count;
					END IF;
          RETURN NULL;
        END;
        $$;

      CREATE TRIGGER trigger_delete_old_rows
        AFTER INSERT ON reserved_products 
        EXECUTE PROCEDURE delete_old_rows();
    SQL
  
  end
end
