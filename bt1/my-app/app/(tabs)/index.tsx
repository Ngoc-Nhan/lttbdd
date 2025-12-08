import { Link } from 'expo-router'
import { View, Text, Image, StyleSheet, TouchableOpacity } from 'react-native'

export default function App() {
  return (
    <View style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <TouchableOpacity style={styles.iconBox}>
          <Link href='/_sitemap'>
            <Text style={styles.iconText}>←</Text>

            {/* <Text style={styles.iconText}>←</Text> */}
          </Link>
        </TouchableOpacity>

        <TouchableOpacity style={styles.iconBox}>
          <Text style={styles.iconText}>📝</Text>
        </TouchableOpacity>
      </View>

      {/* Avatar */}
      <Image
        source={{
          uri: 'https://scontent.fsgn5-2.fna.fbcdn.net/v/t39.30808-6/481287208_1175259297508477_9045075923594267335_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGpQ8uyVO6-UqF74pvL_aNA-MqguD9yAzf4yqC4P3IDNy4m_TUSukXrGULqsWGRiH7h-SrMJQ3nvEnpzsoPXfDf&_nc_ohc=M-Yrrb9GI6YQ7kNvwFWCuad&_nc_oc=AdnsXmUwCrkged7be6zIhd-9xUI8_CTxewsf15EL2UYA9hqm_wtGgPu5C969_nECpiw&_nc_zt=23&_nc_ht=scontent.fsgn5-2.fna&_nc_gid=r5C1diWJjGkKaQdp8AEhNw&oh=00_AfmcKobQzp25n2BsLkyw5mweVnYpsFJh4FESAoAQDhciKw&oe=693C9613'
        }}
        style={styles.avatar}
      />

      {/* Name */}
      <Text style={styles.name}>Ngọc Nhàn</Text>
      <Text style={styles.location}>UTH </Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 80,
    alignItems: 'center',
    backgroundColor: '#fff'
  },

  header: {
    width: '100%',
    paddingHorizontal: 20,
    flexDirection: 'row',
    justifyContent: 'space-between',
    position: 'absolute',
    top: 40
  },

  iconBox: {
    width: 42,
    height: 42,
    borderRadius: 12,

    backgroundColor: '#F5F5F5',
    justifyContent: 'center',
    alignItems: 'center'
  },

  iconText: {
    fontSize: 20,
    fontWeight: 'bold',

  },

  avatar: {
    width: 150,
    height: 150,
    borderRadius: 75,
    marginTop: 80,
    marginBottom: 25
  },

  name: {
    fontSize: 26,
    fontWeight: 'bold'
  },

  location: {
    marginTop: 5,
    fontSize: 18,
    color: '#666'
  }
})