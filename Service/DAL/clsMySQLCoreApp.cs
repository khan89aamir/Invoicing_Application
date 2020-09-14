using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using MySqlConnector;

/// <summary>
/// Summary description for clsCoreApp
/// </summary>
public class clsMySQLCoreApp 
{
    public string strErrorText = "";
    private int Counter = 0;
    private string strColumns;
    private string strValues;
    DataTable dtOutputParm = new DataTable();
    // List for storing sql parameter.
    private char[] c1 = new char[2];
   
    List<MySqlParameter> lstSQLParameter = new List<MySqlParameter>();
    public clsMySQLCoreApp()
    {
        c1[0] = '[';
        c1[1] = ']';
    }

    public enum ParamType
    {
        Input,
        Output
    }

    public bool ResetData()
    {
        try
        {
            // IMP Note : Never make transaction object Null over here.
            Counter = 0;
            strColumns = string.Empty;
            strValues = string.Empty;
            lstSQLParameter.Clear();
            return true;
        }
        catch (Exception ex)
        {
          
            return false;
        }
    }
    public bool SetStoreProcedureData(string strParamterName, MySqlDbType DataType, object Value, ParamType parameterType = ParamType.Input)
    {
        try
        {
            if (Counter == 0)
            {
                strColumns = strParamterName;
                strParamterName = strParamterName.Trim(c1).Replace(" ", string.Empty);
                strValues = "@" + strParamterName;
            }
            else
            {
                strColumns += "," + strParamterName;
                strParamterName = strParamterName.Trim(c1).Replace(" ", string.Empty);
                strValues += ",@" + strParamterName;
            }
            MySqlParameter p = new MySqlParameter("@" + strParamterName.Trim(c1).Replace(" ", string.Empty), DataType);
            p.Value = Value;
            if (parameterType == ParamType.Input)
            {
                p.Direction = ParameterDirection.Input;
            }
            else if (parameterType == ParamType.Output)
            {
                p.Direction = ParameterDirection.Output;
                
                // set the Max size by default for below parm
                if (p.MySqlDbType == MySqlDbType.LongText || p.MySqlDbType == MySqlDbType.Text || p.MySqlDbType == MySqlDbType.VarBinary)
                {
                    p.Size = -1;
                }
            }

            lstSQLParameter.Add(p);
            Counter++;
            return true;
        }
        catch (Exception ex)
        {
            strErrorText = ex.ToString();
            ResetData();
            return false;
        }
    }
    public DataTable ExecuteSelectStatement(string query)
    {
        DataTable dtTable = new DataTable();
        try
        {
          

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        con.Open();
                        sda.Fill(dtTable);


                    }
                }
            }
        }
        catch (Exception  ex)
        {
            strErrorText = ex.ToString();
           
        }
     
        return dtTable;
    }
    public int ExecuteNonQuery(string query)
    {
        int result = -1;
        try
        {


            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                 
                    con.Open();
                    result= cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        {
            strErrorText = ex.ToString();

        }

        return result;
    }
    private void InitOutputTable()
    {
        if (dtOutputParm.Columns.Count == 0)
        {
            dtOutputParm.Columns.Add("ParmName");
            dtOutputParm.Columns.Add("Value", typeof(object));
        }
    }
    private void AddRowToOutputParm(string name, object value)
    {

        DataRow dataRow = dtOutputParm.NewRow();
        dataRow["ParmName"] = name.Replace("@", "");
        dataRow["Value"] = value;

        dtOutputParm.Rows.Add(dataRow);
    }
    /// <summary>
    /// Execute the store Procedure for DML operation and  and returns true or false
    /// </summary>
    /// <param name="strStoreProcedureName">Name of the procedure</param>
    /// <returns>Operation success result</returns>
    public bool ExecuteStoreProcedure_DML(string strStoreProcedureName)
    {
        bool result = false;
        if (dtOutputParm != null && dtOutputParm.Rows.Count > 0)
        {
            dtOutputParm.Clear();
        }

       
      

        try
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (MySqlConnection con=new MySqlConnection(constr))
            {
                MySqlCommand cmd = new MySqlCommand();


                cmd.CommandText = strStoreProcedureName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                // if sp is called with parameters.
                if (lstSQLParameter.Count > 0)
                {
                    MySqlParameter[] p = lstSQLParameter.ToArray();
                    cmd.Parameters.AddRange(p);
                }

                con.Open();
                cmd.ExecuteNonQuery();

                // check if there is any output parameter.
                for (int i = 0; i < cmd.Parameters.Count; i++)
                {
                    if (cmd.Parameters[i].Direction == ParameterDirection.Output)
                    {
                        InitOutputTable();
                        AddRowToOutputParm(cmd.Parameters[i].ParameterName, cmd.Parameters[i].Value);
                    }
                }
                result = true;
                con.Close();
            }
          
           
        }
        catch (Exception ex)
        {
            strErrorText = ex.ToString();
            ResetData();
            result = false;
        }
        ResetData();
        return result;
    }


    /// <summary>
    /// Execute the store Procedure and returns the data table.
    /// </summary>
    /// <param name="strStoreProcedureName">Name of the procedure.</param>
    /// <returns>Data Set</returns>
    public DataSet ExecuteStoreProcedure_Get(string strStoreProcedureName)
    {
      
        // clear the output parm table for fresh data.
        if (dtOutputParm != null && dtOutputParm.Rows.Count > 0)
        {
            dtOutputParm.Clear();
        }
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        DataSet ds = new DataSet();
        using (MySqlConnection con=new MySqlConnection(constr))
        {
            MySqlCommand cmd = new MySqlCommand();
          
            try
            {
               
               MySqlDataAdapter ObjDA = new MySqlDataAdapter();
                cmd.CommandText = strStoreProcedureName;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;

                // if sp is called with parameters.
                if (lstSQLParameter.Count > 0)
                {
                    MySqlParameter[] p = lstSQLParameter.ToArray();
                    cmd.Parameters.AddRange(p);
                }

                con.Open();
                ObjDA.SelectCommand = cmd;
                ObjDA.Fill(ds);

                // check if there is any output parameter.
                for (int i = 0; i < cmd.Parameters.Count; i++)
                {
                    if (cmd.Parameters[i].Direction == ParameterDirection.Output)
                    {
                        InitOutputTable();
                        AddRowToOutputParm(cmd.Parameters[i].ParameterName, cmd.Parameters[i].Value);
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                strErrorText = ex.ToString();
                ResetData();
                return null;
            }
            ResetData();

        }
      
        return ds;
    }


}