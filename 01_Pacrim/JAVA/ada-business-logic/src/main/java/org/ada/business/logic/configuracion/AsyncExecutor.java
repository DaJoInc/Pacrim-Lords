package org.ada.business.logic.configuracion;

import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.annotation.AsyncConfigurerSupport;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

public class AsyncExecutor extends AsyncConfigurerSupport {

@Override
public TaskExecutor  getAsyncExecutor() {
    ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
    executor.setCorePoolSize(2);
    executor.setMaxPoolSize(2);
    executor.setQueueCapacity(500);
    executor.setThreadNamePrefix("Retiros-");
    executor.setKeepAliveSeconds(1);
    executor.setAllowCoreThreadTimeOut(true);
    executor.initialize();
    return executor;
}

}
