package org.dataengineering.producer;

import com.launchdarkly.eventsource.EventHandler;
import com.launchdarkly.eventsource.EventSource;
import org.apache.kafka.clients.producer.KafkaProducer;

import java.net.URI;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

public class WikimediaChangesProducer {

    public static void main(String[] args) throws InterruptedException {

        // Set producer properties
        // TODO: Set the producer properties for the serializer and for the connection to the upstash cluster
        Properties props = new Properties();
        props.put("example.key.1", "example value 1");
        props.put("example.key.2", "example value 2");
        props.put("example.key.n", "example value n");

        // Create event handler
        // TODO: Specify the topic name to which the producer will send messages
        String topic = "example_topic";
        KafkaProducer<String, String> producer = new KafkaProducer<>(props);
        EventHandler eventHandler = new WikimediaChangeHandler(producer, topic);

        // Create event source
        // TODO: Specify the URL from which the producer will read messages
        String url = "https://example_url";
        EventSource.Builder builder = new EventSource.Builder(eventHandler, URI.create(url));
        EventSource eventSource = builder.build();

        // Run the producer for 15 minutes
        eventSource.start();
        TimeUnit.MINUTES.sleep(15);
    }
}
