interface AudioPlayer{
    audioVolume: number;
    songDuration: Number;
    song: String;
    details: Details;
};

interface Details{
    author: String;
    year: Number;
};

const audioPlayer: AudioPlayer = {
    audioVolume: 90,
    songDuration: 36,
    song: "Somebody Else",
    details: {
        author: 'The 1975',
        year: 2016
    }
}

console.log('song:', audioPlayer.song);
console.log('author:', audioPlayer.details.author);
console.log('songDuration:', audioPlayer.songDuration);

// const {song, songDuration} = audioPlayer;
// console.log('song:', song);

// const {song: anotherSong, songDuration: songDuration} = audioPlayer;
// console.log('song:', anotherSong);
// const song = 'New Song';

// const {details} = audioPlayer;
// const {author} = details;
// console.log('author:', author);

const { song: anotherSong, songDuration: duration, details: {author} } = audioPlayer; 

console.log('author:', author);

const team7: string[] = ['Naruto', 'Sasuke', 'Sakura'];
console.log('Personaje 3:', team7[3] || 'No encontrado');

// const sakura = team7[3] || 'No encontrado';
// console.log('Personaje 3:', sakura);

// const [ naruto, sasuke, sakura]: string[] = ['Naruto', 'Sasuke', 'Sakura'];
// console.log('Personaje 3:', naruto);

const [,, sakura = 'No encontrado']: string[] = ['Naruto', 'Sasuke', 'Sakura'];
console.log[sakura];

//export {};
