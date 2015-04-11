注意：EventList和EventQueue的区别
EventList表记录所有事件，并且是监听EventList的改变(insert)
EventQueue用于模拟事件队列，执行里面的事件后，立即删除。(使用数据表模拟其实是恰当的,事件处理具有及时性，应该直接放内存，而不是数据库，频繁操作数据库效率低而且没必要)

在EventList上加了触发器，当往EventList中插入数据的同时往EventQueue中加入数据

步骤一：在SQL Server上执行ALTER DATABASE <DatabaseName> SET ENABLE_BROKER;语句让相应的数据库启用监听服务，以便支持SqlDependency特性。

步骤二：在需要使用EventListenerFrameWork的程序配置监听数据库连接字符串  
<connectionStrings>
    <add name="EventConnStr" connectionString="data source=.;initial catalog=ListenEvent;uid=sa;pwd=qinaoqinao" />
</connectionStrings>