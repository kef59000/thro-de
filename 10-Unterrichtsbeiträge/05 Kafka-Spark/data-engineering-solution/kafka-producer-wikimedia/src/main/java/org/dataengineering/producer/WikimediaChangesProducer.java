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
        Properties props = new Properties();
        props.put("bootstrap.servers", "insert your property value here");
        props.put("sasl.jaas.config", "insert your property value here");
        props.put("sasl.mechanism", "SCRAM-SHA-256");
        props.put("security.protocol", "SASL_SSL");
        props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
        props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

        // Create event handler
        String topic = "wikimedia.recentchange";
        KafkaProducer<String, String> producer = new KafkaProducer<>(props);
        EventHandler eventHandler = new WikimediaChangeHandler(producer, topic);

        // Create event source
        String url = "https://stream.wikimedia.org/v2/stream/recentchange";
        EventSource.Builder builder = new EventSource.Builder(eventHandler, URI.create(url));
        EventSource eventSource = builder.build();

        // Run the producer for 15 minutes
        eventSource.start();
        TimeUnit.MINUTES.sleep(15);
    }
}
