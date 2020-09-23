import io.confluent.kafka.serializers.KafkaAvroSerializerConfig;
import org.apache.kafka.clients.producer.*;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.common.serialization.LongSerializer;
import io.confluent.kafka.serializers.KafkaAvroSerializer;
import java.util.Properties;
import java.util.stream.IntStream;

public class AvroProducer implements org.apache.kafka.clients.producer.Callback {
    
    private Producer<Long, Test> createProducer(String broker, String registry) {
        Properties props = new Properties();
        props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, broker);
        props.put(ProducerConfig.CLIENT_ID_CONFIG, "AvroProducer");
        props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
                LongSerializer.class.getName());
        props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
                KafkaAvroSerializer.class.getName());
        props.put(KafkaAvroSerializerConfig.SCHEMA_REGISTRY_URL_CONFIG, registry);
        return new KafkaProducer<>(props);
    }
    
    public static class Test {
        public int id;
        public String name;
        public Test(int id, String name) {
            this.id = id;
            this.name = name;
        }
    }
    
    public static void main(String... args) {
        AvroProducer thisObj = new AvroProducer();
        thisObj.send(args[0], args[1], args[2]);
    }
    
    private void send(String broker, String registry, String topic) {
        Producer<Long, Test> producer = createProducer(broker, registry);
        Test test1 = new Test(1, "one");
        producer.send(new ProducerRecord<Long, Test>(topic, test1), this);
        
//        IntStream.range(1, 100).forEach(index->{
//            producer.send(new ProducerRecord<>(TOPIC, 1L * index, bob));
//        });
        producer.flush();
        producer.close();
    }
    
    @Override
	public void onCompletion(RecordMetadata metadata, Exception exception) {}
}